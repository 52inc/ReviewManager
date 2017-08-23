//
//  ReviewManager.swift
//  52inc
//
//  Created by Brendan Lee on 3/29/17.
//  Copyright © 2017 52inc. All rights reserved.
//

import UIKit
import StoreKit

public class ReviewManager {
    
    public static let shared: ReviewManager = ReviewManager()
    
    fileprivate var reviewPromptTimer: Timer? {
        willSet {
            if let validTimer = reviewPromptTimer, validTimer.isValid
            {
                validTimer.invalidate()
            }
        }
    }
    
    fileprivate init()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(windowDidBecomeVisible(notification:)), name: .UIWindowDidBecomeVisible, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func promptForReview(appId: String? = nil)
    {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
            
            reviewPromptTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(showStoreFromTimer(timer:)), userInfo: appId, repeats: false)
            
        } else {
            
            // Fallback on earlier versions
            if let validAppId = appId
            {
                openAppStore(appId: validAppId)
            }
        }
    }
    
    public func openAppStore(appId: String)
    {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://itunes.apple.com/app/id\(appId)?action=write-review")!, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(URL(string: "https://itunes.apple.com/app/id\(appId)?action=write-review")!)
        }
    }
    
    @objc fileprivate func showStoreFromTimer(timer: Timer)
    {
        if let validAppId = timer.userInfo as? String
        {
            openAppStore(appId: validAppId)
        }
    }

    @objc fileprivate func windowDidBecomeVisible(notification: Notification)
    {
        if let window = notification.object as AnyObject?, String(describing: type(of: window)).hasPrefix("SK")
        {
            reviewPromptTimer = nil
        }
    }
}
