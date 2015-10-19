//
//  HistoryController.swift
//  watch-calculator
//
//  Created by Hampus Nilsson on 18/10/15.
//  Copyright © 2015 Hampus Nilsson. All rights reserved.
//

import Foundation
import WatchKit

class HistoryController : WKInterfaceController
{
    @IBOutlet var table : WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    
        table.setNumberOfRows(CalculatorApp.shared.history.count, withRowType: "HistoryRow")
        
        for (index, entry) in CalculatorApp.shared.history.reverse().enumerate()
        {
            let row = table.rowControllerAtIndex(index) as! HistoryRowController
            row.entryLabel.setText(entry)
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}