//
//  ViewController.swift
//  CoinToss
//
//  Created by main on 10/01/15.
//  Copyright (c) 2015 Marc Risney. All rights reserved.
//

import UIKit
import QuartzCore


class MainViewController: UIViewController {
                            
    @IBOutlet weak var coinOneImage: UIImageView!
    @IBOutlet weak var coinTwoImage: UIImageView!
    @IBOutlet weak var coinThreeImage: UIImageView!
    
    private var coinOne: Coin!
    private var coinTwo: Coin!
    private var coinThree: Coin!
    private var tosses:Int = 0
    private var coinsOutcome: [Coin.CoinSide] = []
    
    
    @IBOutlet weak private var flipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        coinOne = Coin(image: coinOneImage)
        coinTwo = Coin(image: coinTwoImage)
        coinThree = Coin(image: coinThreeImage)
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            self.flipCoinAction(NSNull)
        }
    }
  
    @IBAction func flipCoinAction(sender: AnyObject) {
        
        flipButton.enabled = false
        
        
        delay(randomDouble()) {
            self.coinOne?.flipCoinAction() { side in
                print("Coin 1 Flipped: \(side)")
                self.coinsOutcome.append(side)
            }
        }
        delay(randomDouble()) {
            self.coinTwo.flipCoinAction() { side in
                print("Coin 2 Flipped: \(side)")
                self.coinsOutcome.append(side)

            }
        }
        
        delay(randomDouble()) {
            self.coinThree?.flipCoinAction() { side in
                print("Coin 3 Flipped: \(side)")
                self.coinsOutcome.append(side)

                self.flipButton.enabled = true
                
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    if (self.tosses ==  6){
                        self.tosses = 0
                        self.goToWrex(45)
                    }
                }
            }
        }
        getTossMaxValue(coinsOutcome)
        tosses += 1
    }
    

    @IBAction func onGoToNext(sender: AnyObject) {
        self.performSegueWithIdentifier("ToCoinResults", sender: sender)
    }
    
    private func goToWrex(outcome: Int) {
        self.performSegueWithIdentifier("ToWrexagram", sender: outcome)
    }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let wrexegramView = segue.destinationViewController as? WrexagramViewController {
            if let outcome = sender as? Int {
                print("transitioning to wrexagram with outcome \(outcome)")
                wrexegramView.outcome = outcome
            }
        }
        
    }
    
    private func randomDouble(lower: Double = 0.0, _ upper: Double = 0.35) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
    
    private func delay(delay: Double, closure: ()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(),
            closure
        )
    }
    
    private func getTossMaxValue(coinTossResults: [Coin.CoinSide]){
        
        var counts:[Coin.CoinSide:Int] = [:]
        for coinSide in coinTossResults{
           counts[coinSide] = (counts[coinSide] ?? 0) + 1
        }
        
        print(counts)
        coinsOutcome.removeAll()
    }
}

