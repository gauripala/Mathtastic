//
//  EndViewController.swift
//  MathApp
//
//  Created by Gauri Pala on 6/2/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase

class EndViewController: UIViewController{
    

    var ref = Database.database().reference()
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var questionscorrect: UILabel!
    var points1 = String()
    var topicname = ""
    var master = ""
    let userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        questionscorrect.text = points1
        if Int(points1)!>13{
            result.text = "Topic Mastered!"
            master = "Topic Mastered"
        }
        else{
            result.text = "Topic Not Mastered. Go back to the lesson page or contact us to get direct help from a tutor."
            master = "Topic Not Mastered"
        }
        databasewrite()
        
    }

    func databasewrite() {
        
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        let dateTimeString = formatter.string(from: currentDateTime)

        let result = points1
        let jsonResult = result as NSString
        
        let topic = topicname
        let jsonTopic = topic as NSString
       //convert textfield datatype NSString
        if(Auth.auth().currentUser != nil){
            (self.ref.child("users") as AnyObject).child(userID!).child(jsonTopic as String).child(dateTimeString).setValue(jsonResult)
            (self.ref.child("users") as AnyObject).child(userID!).child(jsonTopic as String).child("M").setValue(master)
        }
        

    }
    
}
