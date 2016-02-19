//
//  DailyYoChingModel.swift
//  DailyYoChing
//
//  Created by Main Account on 9/15/15.
//  Copyright © 2015 Hugh Gallagher LLC. All rights reserved.
//

import Foundation

class DailyYoChingModel {

  var total: Double
  var taxPct: Double
  var subtotal: Double {
    get {
      return total / (taxPct + 1)
    }
  }
  
  init(total: Double, taxPct: Double) {
    self.total = total
    self.taxPct = taxPct
  }
  
  func calcTipWithTipPct(tipPct: Double) -> Double {
    return subtotal * tipPct
  }
  
  func returnPossibleTips() -> [Int: Double] {
   
    let possibleTipsInferred = [0.15, 0.18, 0.20]
   
    var retval = [Int: Double]()
    for possibleTip in possibleTipsInferred {
      let intPct = Int(possibleTip*100)
      retval[intPct] = calcTipWithTipPct(possibleTip)
    }
    return retval
   
  }

}