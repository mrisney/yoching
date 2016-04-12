//
//  WrexagramPagerViewController.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 4/11/16.
//  Copyright © 2016 Gary.com. All rights reserved.
//

import Foundation
import UIKit

class WrexagramPagerViewController : UIPageViewController {
    
    @IBOutlet weak var navTitle: UILabel!
    
    var wrexagrams: [Wrexagram] = []
    var initialIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let initiallViewController = self.viewControllerAtIndex(initialIndex) else { return }
        self.setViewControllers([initiallViewController], direction: .Forward, animated: true, completion: nil)
        self.dataSource = self
        self.delegate = self
        
        self.setNavTitle(toWrexagramNumber: initialIndex + 1)
    }
    
    private func setNavTitle(toWrexagramNumber wrexagramNumber: Int) {
        self.navTitle?.text = "Wrexagram \(wrexagramNumber)"
    }
}

//MARK: Pager Data Source Methods
extension WrexagramPagerViewController : UIPageViewControllerDataSource {
    
    private func viewControllerAtIndex(index: Int) -> UIViewController? {
        
        guard let viewController = storyboard?.instantiateViewControllerWithIdentifier("WrexagramViewController") as? WrexagramViewController
        else { return nil }
        
        guard index >= 0 && index < wrexagrams.count else {
            return nil
        }
        
        viewController.wrexagramNumber = index + 1
        viewController.wrexagram = wrexagrams[index]
        
        return viewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        guard let wrexagram = viewController as? WrexagramViewController else { return nil }
        
        let index = wrexagram.wrexagramNumber - 1
        
        return self.viewControllerAtIndex(index + 1)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        guard let wrexagram = viewController as? WrexagramViewController else { return nil }
        
        let index = wrexagram.wrexagramNumber - 1
        
        return self.viewControllerAtIndex(index - 1)
    }
}

//MARK: Pager Delegate Methods
extension WrexagramPagerViewController : UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        
        guard let first = pendingViewControllers.first as? WrexagramViewController else { return }
        
        let wrexagramNumber = first.wrexagramNumber
        self.setNavTitle(toWrexagramNumber: wrexagramNumber)
    }
}