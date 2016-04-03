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
    var tosses:Int = 0
    
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
            }
        }
        delay(randomDouble()) {
            self.coinTwo.flipCoinAction() { side in
                print("Coin 2 Flipped: \(side)")
            }
        }
        
        delay(randomDouble()) {
            self.coinThree?.flipCoinAction() { side in
                print("Coin 3 Flipped: \(side)")
                self.flipButton.enabled = true
                
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    if (self.tosses ==  6){
                        self.tosses = 0
                        self.goToWrex(1)
                    }
                }
            }
        }
        tosses += 1
    }
    

    @IBAction func onGoToNext(sender: AnyObject) {
        
        self.performSegueWithIdentifier("ToCoinResults", sender: sender)
    }
    
    private func goToWrex(outcome: Int) {
        self.performSegueWithIdentifier("ToWrexegram", sender: outcome)
    }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let wrexegramView = segue.destinationViewController as? WrexegramViewController {
            if let outcome = sender as? Int {
                print("transitioning to wrexegram with outcome \(outcome)")
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
    
    private func loadImageFor(coinResults: [Coin.CoinSide]) -> UIImage {
        let straightLineimage: UIImage? = UIImage(contentsOfFile: "wrex-master-strongline.tif")
        let brokenLineimage: UIImage? = UIImage(contentsOfFile: "wrex-master-strongline.tif")
        return image!
    }


}

