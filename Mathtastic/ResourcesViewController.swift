//
//  ResourcesViewController.swift
//  LoginTesting
//
//  Created by Gauri Pala on 10/8/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class ResourcesViewController:UIViewController{
    
    @IBAction func khan(_ sender: Any) {
        showSafariVC(for: "https://www.khanacademy.org/math/algebra")
    }
    
    @IBAction func purple(_ sender: Any) {
        showSafariVC(for: "https://www.purplemath.com/modules/")
    }
    
    @IBAction func ult(_ sender: Any) {
        showSafariVC(for: "https://www.youtube.com/channel/UCS1YNEY54RYgt9ObzGW2mfg")
    }
    
    
    func showSafariVC(for url1: String)
    {
        let url = URL(string: url1)
        let vc = SFSafariViewController(url: url!)
        present(vc, animated: true, completion: nil)
        
    }
}
