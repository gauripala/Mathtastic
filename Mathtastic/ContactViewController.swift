//
//  ContactViewController.swift
//  LoginTesting
//
//  Created by Gauri Pala on 10/11/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate{
    @IBOutlet weak var topic: UITextField!
    @IBOutlet weak var message: UITextView!
    @IBAction func send(_ sender: Any) {
        let toRecipients = ["gauri.pala@gmail.com"]
       
        if MFMailComposeViewController.canSendMail(){
            let mc = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setToRecipients(toRecipients)
            mc.setSubject(topic.text!)
            mc.setMessageBody(message.text, isHTML: false)
            self.present(mc, animated: true, completion:nil)
        }
        else{
            print("can't send mail on this device")
        }
        
    }
    
}
