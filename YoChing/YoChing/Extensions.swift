//
//  Extensions.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 11/11/15.
//  Copyright © 2015 Gary.com. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    
    func isEven() -> Bool {
        return self % 2 == 0
    }
    
    func isOdd() -> Bool {
        return !self.isEven()
    }
}

//MARK: UIViewController

//Hides the Navigation Bar Lip
extension UIViewController {
    
    func hideNavigationBarShadow() {
        let emptyImage = UIImage()
        self.navigationController?.navigationBar.shadowImage = emptyImage
        self.navigationController?.navigationBar.setBackgroundImage(emptyImage, forBarMetrics: UIBarMetrics.Default)
    }
}


//MARK: String Operations
public extension String {
    public var length: Int { return self.characters.count }
    
    public func toURL() -> NSURL? {
        return NSURL(string: self)
    }
}