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
//    
//    let wrexagrams: [Wrexagram] = [
//        Wrexagram(title: "Bring It"),
//        Wrexagram(title: "With It"),
//        Wrexagram(title: "Stress Getting Started"),
//        Wrexagram(title: "Shorty"),
//        Wrexagram(title: "Looking Out"),
//        Wrexagram(title: "Drama"),
//    ]
    
    lazy var wrexagrams = WrexagramLibrary.wrexagrams
}

//MARK: Segues
extension WrexagramListViewController {
    
    private func goToWrexagram(number: Int) {
        self.performSegueWithIdentifier("ToWrexagram", sender: number)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destination = segue.destinationViewController
        
        if let wrexagram = destination as? WrexagramViewController, let number = sender as? Int {
            wrexagram.wrexagramNumber = number + 1
        }
    }
}


//MARK: Table View Data Methods
extension WrexagramListViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wrexagrams.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Wrexagram", forIndexPath: indexPath) as? WrexagramListCell else {
            return UITableViewCell()
        }
        
        let row = indexPath.row
        
        guard row < wrexagrams.count else { return cell }
        
        let wrexagram = wrexagrams[row]
        
        cell.numberLabel.text = "\(row + 1)"
        cell.title.text = wrexagram.title
        
        return cell
    }
}

//MARK: Table View Delegate Methods
extension WrexagramListViewController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let row = indexPath.row
        
        guard row < wrexagrams.count else { return }
        
        self.goToWrexagram(row)
    }
}

class WrexagramListCell : UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var wrexagramImage: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var arrow: UIButton!
    
}