//
//  ViewController.swift
//  MathApp
//
//  Created by Gauri Pala on 1/12/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

class HomeViewController: UIViewController {

    var guest = ""
    @IBOutlet weak var resources: UIButton!
    @IBOutlet weak var practice: UIButton!
    @IBOutlet weak var lessons: UIButton!
    @IBAction func startButton(_ sender: Any) {
        self.performSegue(withIdentifier: "TopicSegue", sender: self)
    }
    
    @IBAction func logout(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        self.performSegue(withIdentifier: "logout", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "score"{
            let popupvar = segue.destination as! ScoreReportViewController
            popupvar.guest = "true"
    
        }
        
    }
    
    override func viewDidLoad() {
        practice.layer.cornerRadius = 25
        lessons.layer.cornerRadius = 25
        resources.layer.cornerRadius = 25
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Hey Mathtastic Student! Don't forget to keep practicing your algebra. Keep it up!"
        
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            //check the error pm
        }
        
    }


}

