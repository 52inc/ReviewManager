#ReviewManager
A simple class to handle fallbacks from iOS 10.3's review prompt and automatically forward them to the App Store if the prompt doesn't show.

###Including in your project

####Cocoapods
`pod 'ReviewManager'`

####Manually
Add the file "ReviewManager.swift" from the Source folder to your project and make sure you link against StoreKit.

###Usage
Usage is very simple.

`````
ReviewManager.shared.promptForReview(appId: "Your-app-store-id-here")
`````

An example for the Apple Store app is:

`````
ReviewManager.shared.promptForReview(appId: "375380948")
`````

###Behavior notes on iOS 10.3's prompt
1. On debug builds the iOS 10.3 prompt always shows
2. It won't show on TestFlight builds. (Should cause App Store fallback every time)
3. There are rules as to when it will be shown to App Store users, and it can be disabled globally by a user (hence the need for fallback).

###Behavior notes from the developer
1. Please don't use this to automatically prompt or send people to the App Store. It's terribly user hostile. This was developed for if you need a "rate app" button in your app, and where the button not doing anything looks like a glitch.
