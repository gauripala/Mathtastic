//
//  PopupViewController.swift
//  MathApp
//
//  Created by Gauri Pala on 6/1/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit
class PopupViewController: UIViewController{
    
    var myString = String()
    var correctAnswer = String()
    var explain = String()
    var questioncount = 0
    var questionnumber = 0
    var score = 0
    var topic = ""
    @IBOutlet weak var correctAnswertitle: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "explain")
        {
            let exvar = segue.destination as! ExplanationViewController
            exvar.explanations = String(explain)
            exvar.qcount = questioncount
            exvar.qnumber = questionnumber
            exvar.scores = score
            exvar.topics = topic
            
        }
        if(segue.identifier == "noend")
        {
            let novar = segue.destination as! EndViewController
            novar.points1 = String(score)
            novar.topicname = topic
        }
    }
    @IBAction func nobutton(_ sender: Any) {
        if(questioncount == questionnumber){
            performSegue(withIdentifier: "noend", sender: self)
        }
        else{
            dismiss(animated: true)
        }
    }
    @IBAction func yesbutton(_ sender: Any) {
        performSegue(withIdentifier: "explain", sender: self)
    }
    
    
  
    
    override func viewDidLoad() {
        correctAnswertitle.text = myString
        answer.text = "Correct Answer:\n" + correctAnswer
    }
    
}
