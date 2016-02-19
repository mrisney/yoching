//
//  InfoViewController.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 11/11/15.
//  Copyright © 2015 Gary.com. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController : UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func onBackButton(sender: AnyObject) {
        self.dismiss()
    }
    
    private func dismiss() {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}