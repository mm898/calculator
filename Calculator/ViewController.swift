//
//  ViewController.swift
//  Calculator
//
//  Created by Mukhtar Alhejji on 2016-12-24.
//  Copyright © 2016 Mukhtar Alhejji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTypying = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypying{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else{
            display.text = digit
        }
        userIsInTheMiddleOfTypying = true
    }
    
    
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }

    private var brain = CalculatorBrain()
    
    @IBAction private func preformOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTypying{
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTypying = false
        }
        if let mathSymbol = sender.currentTitle{
            brain.preformOperation(symbol: mathSymbol)
        }
        displayValue = brain.result
    }

}

