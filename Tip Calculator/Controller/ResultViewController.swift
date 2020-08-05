//
//  ResultViewController.swift
//  Tip Calculator
//
//  Created by Mirana Abrar Anwar on 8/6/20.
//  Copyright © 2020 Mirana Anwar. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result : String?
    var advice : String?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result
        adviceLabel.text = advice
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }
}

