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
    
    @IBOutlet weak private var flipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        coinOneImage.image = nil
//        coinTwoImage.image = nil
//        coinThreeImage.image = nil

        coinOne = Coin(image: coinOneImage)
        coinTwo = Coin(image: coinTwoImage)
        coinThree = Coin(image: coinThreeImage)
    }
    
    
    @IBAction func flipCoinAction(sender: AnyObject) {
        
        flipButton.enabled = false
        
        coinOne?.flipCoinAction() { side in
            print("Coin 1 Flipped: \(side)")
        }
        
        coinTwo.flipCoinAction() { side in
            print("Coin 2 Flipped: \(side)")
        }
        
        coinThree?.flipCoinAction() { side in
            print("Coin 3 Flipped: \(side)")
            self.flipButton.enabled = true
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
    
}

