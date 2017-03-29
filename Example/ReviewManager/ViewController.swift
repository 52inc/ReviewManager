//
//  ViewController.swift
//  ReviewManager
//
//  Created by Brendan Lee on 3/29/17.
//  Copyright © 2017 52inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func promptReviewPressed(_ sender: Any) {
        
        /* Notes from Apple on behavior of iOS 10.3's prompt:
         1. On debug builds the iOS 10.3 prompt always shows
         2. It won't show on TestFlight builds. (Should cause App Store fallback every time)
         3. There are rules as to when it will be shown to App Store users, and it can be disabled globally by a user (hence the need for fallback).
         
           Note from developer:
         1. Please don't use this to auto-prompt / send people to the App Store. It's terribly user hostile. This was developer for if you need a "rate app" button in your app, and where the button not doing anything looks like a glitch.
         */
        
        // Obviously this demo app isn't on the App Store, so we'll use the Apple Store app as the App Store link fallback for example purposes.
        ReviewManager.shared.promptForReview(appId: "375380948")
    }
}

