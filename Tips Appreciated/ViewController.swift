//
//  ViewController.swift
//  Tips Appreciated
//
//  Created by Pavithra Gunasekar on 3/8/17.
//  Copyright © 2017 Pavithra Gunasekar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TipPercentDelegate {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billField.becomeFirstResponder()
        
        var defaultTipNo: Int? = userDefaults.object(forKey: "defaultTip") as! Int?
        if (defaultTipNo == nil){
            defaultTipNo = 0
            userDefaults.set(defaultTipNo, forKey: "defaultTip")
        }
        
        switch (defaultTipNo!) {
        case 0:
            tipControl.selectedSegmentIndex = 0
        case 1:
            tipControl.selectedSegmentIndex = 1
        case 2:
            tipControl.selectedSegmentIndex = 2
        default:
            tipControl.selectedSegmentIndex = 0
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userDidSelectTip(per: Float) {
        tipControl.selectedSegmentIndex = Int(per)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settings = segue.destination as? SettingsViewController{
            settings.delegate = self
        }
    }    

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
        
    }
}

