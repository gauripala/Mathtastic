//
//  Lessons.swift
//  LoginTesting
//
//  Created by Gauri Pala on 9/7/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class LessonsViewController: UIViewController, SFSafariViewControllerDelegate{
    
    @IBOutlet weak var ba: UIButton!
    @IBOutlet weak var eq: UIButton!
    @IBOutlet weak var ine: UIButton!
    @IBOutlet weak var pro: UIButton!
    @IBOutlet weak var lin: UIButton!
    @IBOutlet weak var sys: UIButton!
    @IBOutlet weak var abs: UIButton!
    @IBOutlet weak var exp: UIButton!
    @IBOutlet weak var poly: UIButton!
    @IBOutlet weak var `func`: UIButton!
    @IBOutlet weak var quad: UIButton!
    @IBOutlet weak var rad: UIButton!
    @IBOutlet weak var rat: UIButton!
    @IBOutlet weak var trig: UIButton!
    @IBOutlet weak var stat: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ba.layer.cornerRadius = 20
        eq.layer.cornerRadius = 20
        ine.layer.cornerRadius = 20
        pro.layer.cornerRadius = 20
        lin.layer.cornerRadius = 20
        sys.layer.cornerRadius = 20
        abs.layer.cornerRadius = 20
        exp.layer.cornerRadius = 20
        poly.layer.cornerRadius = 20
        `func`.layer.cornerRadius = 20
        quad.layer.cornerRadius = 20
        rad.layer.cornerRadius = 20
        rat.layer.cornerRadius = 20
        trig.layer.cornerRadius = 20
        stat.layer.cornerRadius = 20
    }
    @IBAction func basicAritAction(_ sender: Any) {
       showSafariVC(for: "https://docs.google.com/document/d/1r-3WMvHFBlmFalspNzaHb6YZW8PYfk__eGAgJ73h8ak/edit?usp=sharing")
    }
    
    
    
    func showSafariVC(for url1: String)
    {
        let url = URL(string: url1)
        let vc = SFSafariViewController(url: url!)
        present(vc, animated: true, completion: nil)
        
    }
    
}
