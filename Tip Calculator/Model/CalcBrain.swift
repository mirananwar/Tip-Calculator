//
//  CalcBrain.swift
//  Tip Calculator
//
//  Created by Mirana Abrar Anwar on 8/6/20.
//  Copyright © 2020 Mirana Anwar. All rights reserved.
//

import UIKit

struct CalcBrain{
    
    
    func calcBill(billText : Double, tip:Double, people : Double) -> Double{
         let splitBill = billText / people
         let tipAmount = billText * tip
         let splitTip = tipAmount / people
         let finalAmount = splitBill + splitTip
        return finalAmount
    }
    
    func adviceLabel(people : Int, tip:Double) -> String {
        let accTip = tip * 100
        return "Split between \(people) people, with \(accTip)% tip."
    }
}
