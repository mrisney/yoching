//
//  SettingsViewController.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 4/11/16.
//  Copyright © 2016 Gary.com. All rights reserved.
//

import AromaSwiftClient
import Foundation

class SettingsViewController : UITableViewController {
    
    
    private let BUY_BOOK_LINK = "http://www.amazon.com/Yo-Ching-Ancient-Knowledge-Streets/dp/0996462503"
    private let BOOK_INFO_LINK = "http://yoching.net"
    
    private let getBookPath = NSIndexPath(forRow: 1, inSection: 1)
    private let seeStreetCredsPath = NSIndexPath(forRow: 2, inSection: 1)
    private let seeInfoPath = NSIndexPath(forRow: 3, inSection: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideNavigationBarShadow()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}


//MARK: Opening Links
extension SettingsViewController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath == getBookPath {
            self.openLink(BUY_BOOK_LINK)
        }
        else if indexPath == seeInfoPath {
            self.openLink(BOOK_INFO_LINK)
        }
        else if indexPath == seeStreetCredsPath {
            print("Showing Street Creds")
        }
        
        
    }
    
    private func openLink(link: String) {
        
        guard let url = link.toURL() else { return }
        
        defer {
            AromaClient.begin()
                .withTitle("Opened Link")
                .withBody(link + "\n\n" + "By \(UIDevice.currentDevice().name)")
                .withUrgency(.MEDIUM)
                .send()
        }
        
        let app = UIApplication.sharedApplication()
        app.openURL(url)
        
    }
}
