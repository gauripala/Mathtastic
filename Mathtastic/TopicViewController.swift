//
//  TopicViewController.swift
//  MathApp
//
//  Created by Gauri Pala on 1/25/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit

class TopicViewController: UIViewController {
    @IBOutlet weak var ba: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var `in`: UIButton!
    @IBOutlet weak var pro: UIButton!
    @IBOutlet weak var lin: UIButton!
    @IBOutlet weak var sys: UIButton!
    @IBOutlet weak var abs: UIButton!
    @IBOutlet weak var exp: UIButton!
    @IBOutlet weak var poly: UIButton!
    @IBOutlet weak var `func`: UIButton!
    @IBOutlet weak var rad: UIButton!
    @IBOutlet weak var stat: UIButton!
    @IBOutlet weak var trip: UIButton!
    @IBOutlet weak var rat: UIButton!
    @IBOutlet weak var quad: UIButton!
    override func viewDidLoad() {
        ba.layer.cornerRadius = 20
        e.layer.cornerRadius = 20
        `in`.layer.cornerRadius = 20
        pro.layer.cornerRadius = 20
        lin.layer.cornerRadius = 20
        sys.layer.cornerRadius = 20
        abs.layer.cornerRadius = 20
        exp.layer.cornerRadius = 20
        poly.layer.cornerRadius = 20
        `func`.layer.cornerRadius = 20
        rad.layer.cornerRadius = 20
        stat.layer.cornerRadius = 20
        trip.layer.cornerRadius = 20
        rat.layer.cornerRadius = 20
        quad.layer.cornerRadius = 20
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func startButton(_ sender: Any) {
           self.performSegue(withIdentifier: "arithmetic", sender: self)
    }

    @IBAction func equations(_ sender: Any) {
        self.performSegue(withIdentifier: "equations", sender: self)
    }
    
}






