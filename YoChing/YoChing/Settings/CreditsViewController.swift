//
//  CreditsViewController.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 4/15/16.
//  Copyright © 2016 YoChing.com. All rights reserved.
//

import Foundation
import UIKit


class CreditsViewController : UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSprayForBlackBackground()
        
        addSwipeGesture()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    private func addSwipeGesture() {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(self.onSwipe(_:)))
        gesture.direction = .Right
        
        self.tableView.addGestureRecognizer(gesture)
    }
    
    @IBAction func onSwipe(segue: UIStoryboardSegue) {
        self.exit()
    }
}

//MARK : Table View Delegate Methods
extension CreditsViewController {
    
    
}

//MARK : Segues
extension CreditsViewController {
    
    private func exit() {
        self.performSegueWithIdentifier("unwind", sender: self)
    }
}