//
//  InterfaceController.swift
//  watch-calculator WatchKit Extension
//
//  Created by Hampus Nilsson on 14/10/15.
//  Copyright © 2015 Hampus Nilsson. All rights reserved.
//

import WatchKit
import Foundation


class CalculatorController : WKInterfaceController {
    
    @IBOutlet var inputTextLabel : WKInterfaceLabel!
    
    var enteredText : String = ""

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.setTitle("Calculator")
        
        // NSLog("Activated the Interface Controller")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
        // NSLog("Deactivated the Interface Controller")
    }
    
    
    func appendText(symbol : String) {
        enteredText += symbol
        
        updateText()
    }
    
    func updateText() {
        if enteredText.characters.count > 0
        {
            inputTextLabel.setText(String(format: "%@ = %.0f", enteredText, parseLTRExpression(enteredText)))
        }
        else
        {
            inputTextLabel.setText("")
        }
    }
    
    
    @IBAction func enterNumber1() {
        appendText("1")
    }
    
    @IBAction func enterNumber2() {
        appendText("2")
    }
    
    @IBAction func enterNumber3() {
        appendText("3")
    }
    
    @IBAction func enterNumber4() {
        appendText("4")
    }
    
    @IBAction func enterNumber5() {
        appendText("5")
    }
    
    @IBAction func enterNumber6() {
        appendText("6")
    }
    
    @IBAction func enterNumber7() {
        appendText("7")
    }
    
    @IBAction func enterNumber8() {
        appendText("8")
    }
    
    @IBAction func enterNumber9() {
        appendText("9")
    }
    
    @IBAction func enterNumber0() {
        appendText("0")
    }
    
    @IBAction func clear() {
        enteredText = ""
        updateText()
    }
    
    @IBAction func enterDot() {
        guard enteredText.characters.last != "." else { return }
        
        // TODO: Should not allow multiple dots in one number
        appendText(".")
    }
    
    @IBAction func sumTotal() {
        enteredText = String(format: "%.0f", parseLTRExpression(enteredText))
        updateText()
    }
    
    @IBAction func save() {
        let saveText = String(format: "%@ = %.0f", enteredText, parseLTRExpression(enteredText))
        CalculatorApp.shared.history.append(saveText)
    }
    
    @IBAction func enterPlus() {
        if enteredText.characters.last == "+"
        {
            enteredText = enteredText.substringToIndex(enteredText.endIndex.predecessor()) + "-"
            updateText()
        }
        else if enteredText.characters.last == "-"
        {
            enteredText = enteredText.substringToIndex(enteredText.endIndex.predecessor()) + "+"
            updateText()
        }
        else
        {
            appendText("+")
        }
    }
    
    
    // This parses an expression left-to-right
    // Only support + and -
    func parseLTRExpression(input : String) -> Double
    {
        var sum = 0.0
        var currentNumber = "";
        var currentOperator = "+" as Character;
        
        func applyLastOperator()
        {
            let asNumber = (currentNumber as NSString).doubleValue
            switch (currentOperator) {
            case "+":
                sum += asNumber
            case "-":
                sum -= asNumber
            default:
                sum = asNumber
            }
            
            currentNumber = ""
        }
        
        for c in input.characters
        {
            if (c >= "0" && c <= "9") || c == "."
            {
                currentNumber.append(c)
            }
            else if c == "+" || c == "-"
            {
                applyLastOperator()
                currentOperator = c
            }
        }
        
        applyLastOperator()
        
        return sum
    }
}
























