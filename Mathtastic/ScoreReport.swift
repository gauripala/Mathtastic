//
//  ScoreReport.swift
//  LoginTesting
//
//  Created by Gauri Pala on 9/5/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth

class ScoreReportViewController: UIViewController{
   
    var guest = ""
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var userID = ""
    @IBOutlet weak var ba: UILabel!
    @IBOutlet weak var equ: UILabel!
    @IBOutlet weak var ineq: UILabel!
    @IBOutlet weak var prop: UILabel!
    @IBOutlet weak var lin: UILabel!
    @IBOutlet weak var sys: UILabel!
    @IBOutlet weak var abs: UILabel!
    @IBOutlet weak var expo: UILabel!
    @IBOutlet weak var poly: UILabel!
    @IBOutlet weak var fun: UILabel!
    @IBOutlet weak var quad: UILabel!
    @IBOutlet weak var rad: UILabel!
    @IBOutlet weak var rat: UILabel!
    @IBOutlet weak var trig: UILabel!
    @IBOutlet weak var stat: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(Auth.auth().currentUser != nil){
            userID = (Auth.auth().currentUser!.uid)
        }
        ref = Database.database().reference()
        
        let topics = ["Basic Arithmetic","Equations","Inequalities","Proportions and Percents","Linear Equations and Inequalities","System of Equations and Inequalities","Absolute Value","Exponents","Polynomials","Functions and Relations","Quadratic Equations/Functions","Radicals","Rationals","Trignometry","Statistics"]
        let labels:[UILabel?] = [ba,equ,ineq,prop,lin,sys,abs,expo,poly,fun,quad,rad,rat,trig,stat]
        
        for i in 0...14{
            if !(userID).isEmpty {
                ref?.child("users").child(String(userID)).child(topics[i]).observeSingleEvent(of: .value, with: { (snapshot) in
                    if snapshot.value is NSNull{
                        let label = labels[i]
                        label?.text = "Topic Not Yet Practiced"
                    }
                    else if let snapshotValue = snapshot.value as? [String:AnyObject]{
                       let num = snapshotValue["M"]
                        let label = labels[i]
                        label!.text = num as? String
                    }
                }
            )}
            else{
                let label = labels[i]
                label?.text = "Logged In as Guest"
            }
                
        }
            
    }
}
    
    
    
    

