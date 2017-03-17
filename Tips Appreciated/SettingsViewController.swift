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

/*protocol BackgroundColorDelegate{
    func yellow()
    func gray()
    func green()
}*/
class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl! = UISegmentedControl()
    var delegate:TipPercentDelegate? = nil
    //var bgDelegate:BackgroundColorDelegate? = nil
    let tipUserDefaults = UserDefaults.standard
    let colorUserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func yellow(_ sender: AnyObject) {
        //if (bgDelegate != nil){
            view.backgroundColor = UIColor.yellow
            //bgDelegate!.userDidSelectColor()
            colorUserDefaults.set("yellow", forKey: "backColor")
            colorUserDefaults.synchronize()
            _ = self.navigationController?.popViewController(animated: true)
        // }
    }
    
    @IBAction func gray(_ sender: AnyObject) {
        //if (bgDelegate != nil){
            view.backgroundColor = UIColor.lightGray
           // bgDelegate!.userDidSelectColor()
            colorUserDefaults.set("gray", forKey: "backColor")
            colorUserDefaults.synchronize()
            _ = self.navigationController?.popViewController(animated: true)
       // }
    }
    
    @IBAction func green(_ sender: AnyObject) {
        //if (bgDelegate != nil){
            view.backgroundColor = UIColor.green
            //bgDelegate!.userDidSelectColor()
            colorUserDefaults.set("green", forKey: "backColor")
            colorUserDefaults.synchronize()
            _ = self.navigationController?.popViewController(animated: true)

        //}
    }
    
    @IBAction func setTip(_ sender: AnyObject) {
        if (delegate != nil){
            let percent:Float = Float(defaultTipControl.selectedSegmentIndex)
            delegate!.userDidSelectTip(per: percent)
            tipUserDefaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
            tipUserDefaults.synchronize()
            _ = self.navigationController?.popViewController(animated: true)
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
