//
//  CalculatorViewController.swift
//  Tip Calculator
//
//  Created by Mirana Abrar Anwar on 8/6/20.
//  Copyright © 2020 Mirana Anwar. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var zeroPercent: UIButton!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var twentyPercent: UIButton!
    @IBOutlet weak var billTotalLabel: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    var tip = 0.10
    var value = 2
    var calcBrain = CalcBrain()
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //Deselect all tip buttons via IBOutlets
          zeroPercent.isSelected = false
          tenPercent.isSelected = false
          twentyPercent.isSelected = false
          
          //Make the button that triggered the IBAction selected.
          sender.isSelected = true
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAsANumber / 100
        
        billTotalLabel.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let val = Int(sender.value)
        splitLabel.text = String(val)
        value = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
//        let billText = billTotalLabel.text!
//
//        calcBrain.calcBill(billText: billText, tip: tip, people: Double(value))
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            let billText = Double(billTotalLabel.text!)!

            let finalBill = calcBrain.calcBill(billText: billText, tip: tip, people: Double(value))
            let finalAdvice = calcBrain.adviceLabel(people:value, tip: tip)
                destinationVC.result = String(finalBill)
                destinationVC.advice = finalAdvice
            
        }
    }
}

