//
//  WrexegramViewController.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 11/11/15.
//  Copyright © 2015 Gary.com. All rights reserved.
//

import Foundation
import UIKit

class WrexegramViewController : UIViewController {
    
    @IBOutlet weak var wrexegramImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var webView: UIWebView!
    
    var outcome: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if outcome < 0 {
            self.parentViewController?.dismissViewControllerAnimated(true, completion: nil)
            return
        }
        
        let formattedOutcome = String(format: "%02d", outcome)
        let filename = "wrex\(formattedOutcome)"
        
        if let image = UIImage(named: filename) {
            wrexegramImage.image = image
        }
        
        if let html = NSBundle.mainBundle().pathForResource("wrex01", ofType: "html") {
            do {
                let htmlString = try String(contentsOfFile: html, encoding: NSUTF8StringEncoding)
                webView.loadHTMLString(htmlString, baseURL : NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath))
            } catch {
                
            }
        }
    }
    
}