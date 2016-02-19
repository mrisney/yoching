//
//  ViewController.swift
//  CoinToss
//
//  Created by main on 10/01/15.
//  Copyright (c) 2015 Marc Risney. All rights reserved.
//

import EasyAnimation
import UIKit
import QuartzCore


class MainViewController: UIViewController {
                            
    @IBOutlet weak var coinOne: UIImageView!
    @IBOutlet weak var coinTwo: UIImageView!
    @IBOutlet weak var coinThree: UIImageView!
    @IBOutlet weak private var flipButton: UIButton!
	
	private var repeatCount = 0
	private var animationDuration: Double = 0.4
	private var maxReps = 5
    
    enum CoinSide {
        case HEADS
        case TAILS
    }
    
    private var heads: UIImage {
        return UIImage(named: "heads")!
    }
    
    private var tails: UIImage {
        return UIImage(named: "tails")!
    }
	
    private var coins: [UIImageView] {
        return [coinOne, coinTwo, coinThree]
    }
    
    private func isDone() -> Bool {
        return repeatCount++ > maxReps
    }
	

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png"))
    }
    
    
    
    func doAnimation() {
       
        var delay = 0.0
        for coin in coins {
            coin.layer.contents = heads.CGImage
            flipCoin(coin, withDelay: delay)
            delay += 0.2
        }
        
    }

    private func setToHeads(image: UIImageView) {
        image.image = heads
    }
    
    private func setToTails(image: UIImageView) {
        image.image = tails
    }

    private func flipCoin(coin: UIImageView, withDelay delay: NSTimeInterval = 0.0) {
        
        let maxY = self.navigationController!.navigationBar.frame.origin.y + 10
        print("Max Y: \(maxY)")

        let originalFrame = coin.frame
        var calculatedDuration: Double = Double(maxReps + 1) * animationDuration
        calculatedDuration = calculatedDuration / 2
        
        UIView.animateWithDuration(calculatedDuration, delay: delay, options: [.CurveLinear],
            animations: {
                coin.frame.origin.y = maxY
            },
            completion: { _ in
                UIView.animateWithDuration(calculatedDuration, delay: 1.0, options: [], animations: {
                        coin.frame = originalFrame
                    },
                    completion: nil)
        })
        
        var animationChain: EAAnimationDelayed!
        for _ in 0...self.maxReps {
            animationChain = rotateCoin(coin, chain: animationChain)
        }
        
        animationChain.animateAndChainWithDuration(self.animationDuration, delay: 0.0, options: [],
            animations: {
                coin.layer.transform = CATransform3DIdentity
            },
            completion: nil)
    }
    
    private func rotateCoin(coin: UIImageView, chain: EAAnimationDelayed? = nil) -> EAAnimationDelayed {
        
        guard chain != nil else {
            return UIView.animateAndChainWithDuration(self.animationDuration, delay: 0.0, options: [.CurveLinear],
                animations: {
                    var rotation = CATransform3DIdentity
                    rotation = CATransform3DRotate(rotation, 0.5 * CGFloat(M_PI), 1.0, 0.0, 0.0)
                    
                    coin.layer.transform = rotation
                },
                completion: {_ in
                    coin.layer.contents = self.heads.CGImage
            }).animateAndChainWithDuration(self.animationDuration, delay: 0.0, options: [.CurveLinear],
                animations: {
                    var rotation = coin.layer.transform;
                    rotation = CATransform3DRotate(rotation, 1.0 * CGFloat(M_PI), 1.0, 0.0, 0.0);
                    
                    coin.layer.transform = rotation;
                },
                completion: {_ in
                    coin.layer.contents = self.tails.CGImage
            })
        }
        
        return chain!.animateAndChainWithDuration(self.animationDuration, delay: 0.0, options: [.CurveLinear],
            animations: {
                var rotation = CATransform3DIdentity
                rotation = CATransform3DRotate(rotation, 0.5 * CGFloat(M_PI), 1.0, 0.0, 0.0)
                
                coin.layer.transform = rotation
            },
            completion: {_ in
                coin.layer.contents = self.heads.CGImage
        }).animateAndChainWithDuration(self.animationDuration, delay: 0.0, options: [.CurveLinear],
            animations: {
                var rotation = coin.layer.transform;
                rotation = CATransform3DRotate(rotation, 1.0 * CGFloat(M_PI), 1.0, 0.0, 0.0);
                
                coin.layer.transform = rotation;
            },
            completion: {_ in
                coin.layer.contents = self.tails.CGImage
        })
    }
    
    private func removeAnimationsFrom(images: [UIImageView]) {
        
        for image in images {
            image.layer.removeAllAnimations()
        }
    }
    
 
    
    @IBAction func flipCoinAction(sender: AnyObject) {
        repeatCount = 0;
        removeAnimationsFrom(self.coins)
        doAnimation()
        
    }
    

    
    
    @IBAction func onGoToNext(sender: AnyObject) {
        
        self.performSegueWithIdentifier("ToCoinResults", sender: sender)
    }
    
    private func goToWrex(outcome: Int) {
        self.performSegueWithIdentifier("ToWrexegram", sender: outcome)
    }
  
    
    func headsOrTails() -> CoinSide {
        let result = Int(arc4random())
        return result.isEven() ? .HEADS : .TAILS
    }
    
    func imageFromCoin(side: CoinSide) -> UIImage {
        switch side {
            case .HEADS : return heads
            case .TAILS : return tails
        }
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

