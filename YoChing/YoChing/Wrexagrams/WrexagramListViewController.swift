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
        
        if let viewController = destination as? WrexagramViewController, let number = sender as? Int {
            viewController.wrexagramNumber = number + 1
            let wrexagram = wrexagrams[number]
            viewController.wrexagram = wrexagram
        }
    }
}


//MARK: Table View Data Methods
extension WrexagramListViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = wrexagrams.count
        print("Loading \(count) Wrexagrams")
        return count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Wrexagram", forIndexPath: indexPath) as? WrexagramListCell else {
            return UITableViewCell()
        }
        
        let row = indexPath.row
        
        guard row < wrexagrams.count else { return cell }
        
        let wrexagram = wrexagrams[row]
        
        let number = wrexagram.number ?? row + 1
        
        cell.numberLabel.text = "\(number)"
        cell.title.text = wrexagram.title
        cell.subtitle?.text = wrexagram.subtitle
        //cell.arrow.image = cell.arrow.image?.imageWithRenderingMode(.AlwaysTemplate)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
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
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var arrow: UIImageView!
    
}