//
//  SettingsViewController.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 4/11/16.
//  Copyright © 2016 Gary.com. All rights reserved.
//

import AromaSwiftClient
import Foundation

class Settings {
    
    //MARK: User Preferences
    private static let defaults = NSUserDefaults.standardUserDefaults()
    private static let CLASSIC_KEY = "YoChing.Classic"
    private static let QUICK_KEY = "YoChing.Quick"
    
    
    private(set) static var isQuickEnabled: Bool {
        get {
            return defaults.objectForKey(QUICK_KEY) as? Bool ?? false
        }
        set(newValue) {
            defaults.setObject(newValue, forKey: QUICK_KEY)
        }
    }
    
    private(set) static var isClassicEnabled: Bool {
        get {
            return defaults.objectForKey(CLASSIC_KEY) as? Bool ?? false
        }
        set(newValue) {
            defaults.setObject(newValue, forKey: CLASSIC_KEY)
        }
    }
    
}

class SettingsViewController : UITableViewController {

    //MARK: Cell Outlets
    @IBOutlet weak var classicLabel: UILabel!
    @IBOutlet weak var classicCheckmark: UIImageView!
    @IBOutlet weak var tapThatLabel: UILabel!
    @IBOutlet weak var tapThatCheckmark: UIImageView!
    
    
    //MARK: Links to open
    private let BUY_BOOK_LINK = "http://www.amazon.com/Yo-Ching-Ancient-Knowledge-Streets/dp/0996462503"
    private let BOOK_INFO_LINK = "http://yoching.net"

    //Mark: Throwing Style Paths
    private let classicPath = NSIndexPath(forRow: 1, inSection: 0)
    private let tapThatPath = NSIndexPath(forRow: 2, inSection: 0)
    
    //MARK: Info Paths
    private let getBookPath = NSIndexPath(forRow: 1, inSection: 1)
    private let seeStreetCredsPath = NSIndexPath(forRow: 2, inSection: 1)
    private let seeInfoPath = NSIndexPath(forRow: 3, inSection: 1)
    


    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideNavigationBarShadow()
        setSprayBackground()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    private func setSprayBackground() {
        
        guard let image = UIImage(named: "spray.galaxy.black") else { return }
        guard let frame = self.view?.frame else { return }
        let imageView = UIImageView(frame: frame)
        imageView.contentMode = .ScaleAspectFill
        imageView.image = image
        
        self.tableView.backgroundView = imageView
    }
}

//MARK: Table View Delegates
//MARK: Throwing Style configuration
extension SettingsViewController {
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        setLookForCell(tableView, forIndexPath: indexPath)
        cell.backgroundColor = cell.contentView.backgroundColor
    }
    
    private func setLookForCell(tableView: UITableView, forIndexPath indexPath: NSIndexPath) {
        if indexPath == classicPath {
            if Settings.isClassicEnabled {
                classicCheckmark.hidden = false
                classicLabel.textColor = UIColor.whiteColor()
            }
            else {
                classicCheckmark.hidden = true
                classicLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75)
            }
        }
        else if indexPath == tapThatPath {
            if Settings.isQuickEnabled {
                tapThatCheckmark.hidden = false
                tapThatLabel.textColor = UIColor.whiteColor()
            }
            else {
                tapThatCheckmark.hidden = true
                tapThatLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75)
            }
        }
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
        else if indexPath == classicPath || indexPath == tapThatPath {
            
            Settings.isClassicEnabled = indexPath == classicPath
            Settings.isQuickEnabled = indexPath == tapThatPath
            
            self.setLookForCell(tableView, forIndexPath: classicPath)
            self.setLookForCell(tableView, forIndexPath: tapThatPath)
            
            tableView.deselectRowAtIndexPath(classicPath, animated: true)
            tableView.deselectRowAtIndexPath(tapThatPath, animated: true)
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
