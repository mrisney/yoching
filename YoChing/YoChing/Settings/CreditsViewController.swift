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
    
    
    private let hughPath = NSIndexPath(forRow: 0, inSection: 0)
    private let marcPath = NSIndexPath(forRow: 1, inSection: 0)
    private let wellingtonPath = NSIndexPath(forRow: 2, inSection: 0)
    
    
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
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = cell.contentView.backgroundColor
    }
    
}

//MARK : Segues
extension CreditsViewController {
    
    private func exit() {
        self.performSegueWithIdentifier("unwind", sender: self)
    }
}