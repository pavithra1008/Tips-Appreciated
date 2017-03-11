//
//  SettingsViewController.swift
//  Tips Appreciated
//
//  Created by Pavithra Gunasekar on 3/9/17.
//  Copyright © 2017 Pavithra Gunasekar. All rights reserved.
//

import UIKit

protocol TipPercentDelegate{
    func userDidSelectTip(per: Float)
}

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl! = UISegmentedControl()
    var delegate:TipPercentDelegate? = nil
    let tipUserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setTip(_ sender: AnyObject) {
        if (delegate != nil){
            let percent:Float = Float(defaultTipControl.selectedSegmentIndex)
            delegate!.userDidSelectTip(per: percent)
            tipUserDefaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
            tipUserDefaults.synchronize()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
