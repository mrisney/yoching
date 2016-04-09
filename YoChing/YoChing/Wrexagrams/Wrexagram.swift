//
//  Wrexagram.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 4/7/16.
//  Copyright © 2016 Gary.com. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit


struct Wrexagram {
    
    let title: String
    let subtitle: String?
    let body: String?
    let number: Int?
    
    init(title: String) {
        self.init(title: title, subtitle: nil, body: nil, number: nil)
    }
    
    init(title: String, subtitle: String?, body: String?, number: Int?) {
        self.title = title
        self.subtitle = subtitle
        self.body = body
        self.number = number
    }
    
    static func fromJson(json: JSON) -> Wrexagram {
        
        let title = json["title"].string ?? ""
        let subtitle = json["subtitle"].string ?? ""
        let number = json["number"].int ?? 0
    
        return Wrexagram(title: title, subtitle: subtitle, body: nil, number: number)
    }
}