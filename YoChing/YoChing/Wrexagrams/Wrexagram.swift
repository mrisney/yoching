//
//  Wrexagram.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 4/7/16.
//  Copyright © 2016 Gary.com. All rights reserved.
//

import Foundation
import UIKit


struct Wrexagram {
    private let title: String
    private let body: String?
    private let number: Int?
    
    init(title: String) {
        self.init(title: title, body: nil, number: nil)
    }
    
    init(title: String, body: String?, number: Int?) {
        self.title = title
        self.body = body
        self.number = number
    }
    
    static func fromJson(jsonString: String) -> Wrexagram {
        return Wrexagram(title: "BREAK IT DOWN", body: "When Shit's Popping Off, True Player BRING IT", number: 1)
    }
}