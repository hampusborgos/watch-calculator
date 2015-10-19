//
//  ExtensionDelegate.swift
//  watch-calculator WatchKit Extension
//
//  Created by Hampus Nilsson on 14/10/15.
//  Copyright © 2015 Hampus Nilsson. All rights reserved.
//

import WatchKit

class CalculatorApp : NSObject, WKExtensionDelegate {
    static var shared : CalculatorApp!
    
    func applicationDidFinishLaunching() {
        // Set a static var so we have a type-safe reference to this class at all times
        assert(CalculatorApp.shared == nil)
        CalculatorApp.shared = self
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

}
