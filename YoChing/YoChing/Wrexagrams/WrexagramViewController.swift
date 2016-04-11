//
//  WrexegramViewController.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 11/11/15.
//  Copyright © 2015 Gary.com. All rights reserved.
//

import AromaSwiftClient
import Foundation
import UIKit

class WrexagramViewController : UIViewController {
    
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var wrexegramImage: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    
    var wrexagramNumber: Int = -1
    var wrexagram: Wrexagram?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard wrexagramNumber > 0 else {
            self.parentViewController?.dismissViewControllerAnimated(true, completion: nil)
            return
        }
        
        navTitle.text = "Wrexagram \(wrexagramNumber)"
        
        loadImage()
        loadMessage()
        
        if let wrexagram = self.wrexagram ?? determineWrexagramFromNumber(wrexagramNumber) {
            AromaClient.begin()
                .withTitle("Wrexagram Viewed")
                .withBody("\(wrexagram.asString)\n\nBy \(UIDevice.currentDevice().name)")
                .send()
        }
        else {
            AromaClient.begin()
                .withTitle("Wrexagram Viewed")
                .withBody("Wrexagram \(wrexagramNumber)\n\nBy \(UIDevice.currentDevice().name)")
                .send()
        }
    }
    
    private func loadImage() {
        
    }
    
    private func loadMessage() {
        
        let formattedOutcome = String(format: "wrexagram%02d", wrexagramNumber)
        let filename = "html/\(formattedOutcome)"
        
        if let html = NSBundle.mainBundle().pathForResource(filename, ofType: "html") {
            do {
                let htmlString = try String(contentsOfFile: html, encoding: NSUTF8StringEncoding)
                
                webView.loadHTMLString(htmlString, baseURL : NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath))
                
            } catch let ex {
                AromaClient.begin()
                    .withTitle("Operation Failed")
                    .withBody("\(ex)\n\(UIDevice.currentDevice().name)")
                    .send()
            }
        }
    }
    
}

//MARK: Utility Methods
extension WrexagramViewController {
    
    private func toAttributedString(html: String) -> NSAttributedString? {
        
        guard let data = html.dataUsingEncoding(NSUnicodeStringEncoding) else { return nil }
        
        let options: [String : String] = [
            NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType
        ]
        
        guard let string = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil) else { return nil }
        
        if let font = UIFont.init(name: "Exo-Bold", size: 24) {
            string.addAttribute(NSFontAttributeName, value: font, range: NSRangeFromString(string.string))
            print("Font Loaded")
            
        }
        
        return string
    }
    
    private func determineWrexagramFromNumber(number: Int) -> Wrexagram? {
        let index = number - 1
        
        guard index < WrexagramLibrary.wrexagrams.count else { return nil }
        
        return WrexagramLibrary.wrexagrams[index]
    }
}