//
//  WrexagramLibrary.swift
//  YoChing
//
//  Created by Marc Risney on 4/3/16.
//  Copyright © 2016 Gary.com. All rights reserved.
//

import Foundation


public func getOutcome(hexNum: Int) -> String {
    
    switch (hexNum) {
    
        case 111111: return "wrex01"
        case 111112: return "wrex43"
        case 111121: return "wrex14"
        case 111122: return "wrex34"
        case 111211: return "wrex09"
        case 111212: return "wrex05"
        case 111221: return "wrex26"
        case 111222: return "wrex11"
        case 112111: return "wrex10"
        case 112112: return "wrex58"
        case 112121: return "wrex38"
        case 112122: return "wrex54"
        case 112211: return "wrex61"
        case 112212: return "wrex60"
        case 112221: return "wrex41"
        case 112222: return "wrex19"
        case 121111: return "wrex13"
        case 121112: return "wrex49"
        case 121121: return "wrex30"
        case 121122: return "wrex55"
        case 121211: return "wrex37"
        case 121212: return "wrex63"
        case 121221: return "wrex22"
        case 121222: return "wrex36"
        case 122111: return "wrex25"
        case 122112: return "wrex17"
        case 122121: return "wrex21"
        case 122122: return "wrex51"
        case 122211: return "wrex42"
        case 122212: return "wrex03"
        case 122221: return "wrex27"
        case 122222: return "wrex24"
        case 211111: return "wrex44"
        case 211112: return "wrex28"
        case 211121: return "wrex50"
        case 211122: return "wrex32"
        case 211211: return "wrex57"
        case 211212: return "wrex48"
        case 211221: return "wrex18"
        case 211222: return "wrex46"
        case 212111: return "wrex06"
        case 212112: return "wrex47"
        case 212121: return "wrex64"
        case 212122: return "wrex40"
        case 212211: return "wrex59"
        case 212212: return "wrex29"
        case 212221: return "wrex04"
        case 212222: return "wrex07"
        case 221111: return "wrex33"
        case 221112: return "wrex31"
        case 221121: return "wrex56"
        case 221122: return "wrex62"
        case 221211: return "wrex53"
        case 221212: return "wrex39"
        case 221221: return "wrex52"
        case 221222: return "wrex15"
        case 222111: return "wrex12"
        case 222112: return "wrex45"
        case 222121: return "wrex35"
        case 222122: return "wrex16"
        case 222211: return "wrex20"
        case 222212: return "wrex08"
        case 222221: return "wrex23"
        case 222222: return "wrex02"
        
        default: return "wrex01"
    }
}
