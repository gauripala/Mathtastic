//
//  StatisticsViewController.swift
//  MathApp
//
//  Created by Gauri Pala on 3/29/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController{
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    var pointstext = ""
    var result = ""
    let questions:[String] = ["5x=25;Solve for x","7x+5=54;Solve for x","6x=34;Solve for x"]
    let answers:[[String]] = [["5","4","20","2.5"],["7","49","9","5"],["5.67","6","2","10"]]
    
     let explanations:[String]=["The order of operations is needed in order to solve this problem. Since parentheses comes first in the hierarchy, you have to perform 3 times 9 before you do anything else. This leaves us with 21÷3+27*9+5. Next, we need to do the muliplication and division because it is higher on the hierarchy than addition. Once we do the multiplication and division, we are left with 7+243+5. Now it is a simple addition problem, therefore the correct answer was 255.","test","lol","hi","bye","testing","a","bb","cc","dd","ee","ff","gg","hh","ii"]
        override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
              if(segue.identifier == "popup12")
              {
                  let popupvar = segue.destination as! PopupViewController
                  popupvar.myString = result
                  popupvar.questionnumber = currentQuestion
                  popupvar.questioncount = questions.count
                  popupvar.correctAnswer = answers[currentQuestion-1][0]
                  popupvar.explain = explanations[currentQuestion-1]
                  popupvar.score = points
                  popupvar.topic = "Statistics"
                  
              }
          }
           @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBAction func button(_ sender: Any) {
        if((sender as AnyObject).tag == Int(rightAnswerPlacement)){
                   print("Right!")
                   result = "Correct"
                   points += 1
                   self.performSegue(withIdentifier: "popup12", sender: nil)
               }
               else{
                   print("Wrong")
                   result = "Incorrect"
                   self.performSegue(withIdentifier: "popup12", sender: nil)
               }
               if(currentQuestion != questions.count){
                   newQuestion()
                   score.text = "Score: \(points)"
               }
               else{
                   print("done")
                   score.text = "Score: \(points)"
               }
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
        score.text = "Score: \(points)"
        }
    func newQuestion()
    {
     questionLabel.text = questions[currentQuestion]
     rightAnswerPlacement = arc4random_uniform(4)+1
            
            //create button
            var button: UIButton = UIButton()
            var x = 1
            for i: Int in 1...4
            {
                if button != nil{
                    button = view.viewWithTag(i) as! UIButton
                }
                if(i == Int(rightAnswerPlacement))
                {
                    button.setTitle(answers[currentQuestion][0], for: .normal)
                }
                else{
                    button.setTitle(answers[currentQuestion][x], for: .normal)
                    x += 1
                }
            }
            currentQuestion += 1
        }
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
      }
           
       
    }
        



