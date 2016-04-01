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
    
    
    private var outcome = 0;
    @IBOutlet weak private var flipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinOne = Coin(image: coinOneImage)
        coinTwo = Coin(image: coinTwoImage)
        coinThree = Coin(image: coinThreeImage)
    }
    
    @IBAction func flipCoinAction(sender: AnyObject) {
        
        flipButton.enabled = false
        
        coinOne?.flipCoinAction() { side in
            print("Coin 1 Flipped: \(side)")
//            outcome += 1;
            
        }
        
        delay(0.05) {
            self.coinTwo.flipCoinAction() { side in
                print("Coin 2 Flipped: \(side)")
            }
        }
        
        delay(0.1) {
            self.coinThree?.flipCoinAction() { side in
                print("Coin 3 Flipped: \(side)")
                self.flipButton.enabled = true
                
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    self.goToWrex(1)
                }
            }
        }
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
                print("transitioning to Wrexegram with outcome \(outcome)")
                wrexegramView.outcome = outcome
            }
        }
        
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
}

