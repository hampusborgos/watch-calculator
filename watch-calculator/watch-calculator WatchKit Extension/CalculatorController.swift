//
//  InterfaceController.swift
//  watch-calculator WatchKit Extension
//
//  Created by Hampus Nilsson on 14/10/15.
//  Copyright © 2015 Hampus Nilsson. All rights reserved.
//

import WatchKit
import Foundation


class CalculatorController : WKInterfaceController
{
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.setTitle("Calculator")
        
        NSLog("Activated the Interface Controller")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
        NSLog("Deactivated the Interface Controller")
    }
}
























