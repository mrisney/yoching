//
//  WrexagramListViewController.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 4/7/16.
//  Copyright © 2016 Gary.com. All rights reserved.
//

import Foundation
import UIKit

class WrexagramListViewController : UITableViewController {
    
    let wrexagrams: [Wrexagram] = [
        Wrexagram(title: "Bring It"),
        Wrexagram(title: "With It"),
        Wrexagram(title: "Stress Getting Started"),
        Wrexagram(title: "Shorty"),
        Wrexagram(title: "Looking Out"),
        Wrexagram(title: "Drame"),
    ]
    
}


//MARK: Table View Data Methods
extension WrexagramListViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wrexagrams.count
    }
    
}

//MARK: Table View Delegate Methods
extension WrexagramListViewController {
    
}