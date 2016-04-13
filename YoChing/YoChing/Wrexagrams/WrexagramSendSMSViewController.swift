//
//  WrexagramSendSMSViewController.swift
//  YoChing
//
//  Created by Marc Risney on 4/12/16.
//  Copyright © 2016 YoChing.net All rights reserved.
//

import UIKit
import MessageUI


class WrexagramSendSMSViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    // Send a message
    func sendMessage() {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "Message String"
        messageVC.recipients = [] // Optionally add some tel numbers
        messageVC.messageComposeDelegate = self
        
        presentViewController(messageVC, animated: true, completion: nil)
    }
    
    // Conform to the protocol
    // MARK: - Message Delegate method
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        switch result.rawValue {
        case MessageComposeResultCancelled.rawValue :
            print("message canceled")
            
        case MessageComposeResultFailed.rawValue :
            print("message failed")
            
        case MessageComposeResultSent.rawValue :
            print("message sent")
            
        default:
            break
        }
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
