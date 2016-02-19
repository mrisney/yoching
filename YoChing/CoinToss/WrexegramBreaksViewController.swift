//
//  WrexegramBreaksViewController.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 11/11/15.
//  Copyright © 2015 Gary.com. All rights reserved.
//

import Foundation
import UIKit

class WrexegramBreaksViewController : UIViewController {
    
    @IBOutlet weak var wrexegramImage: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    
    var outcome: Int = -1
    
    override func viewDidLoad() {
        if outcome < 0 {

            return
        }
        
    }
    
    @IBAction func popBackToBeginning(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}