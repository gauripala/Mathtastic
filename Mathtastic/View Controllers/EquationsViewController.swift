//
//  EquationsViewController.swift
//  MathApp
//
//  Created by Gauri Pala on 3/29/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit

class EquationsViewController: UIViewController {
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    var pointstext = ""
    var result = ""
    let questions:[String] = ["5x=25\nSolve for x","7x+5=54\nSolve for x","6x=34\nSolve for x","4x-7(2-x)=3x+2\nSolve for x","2(x+3)-10=6(32-3x)\nSolve for x","2x-4=6\nSolve for x","2x+15=-3x\nSolve for x","0=-1-y\nSolve for x","(x+9)/5=2\nSolve for x","For babysitting, Hannah charges a flat fee of $8, plus $5 per hour. Which equation correctly represents cost, c, after h hours of babysitting?","Jack's father is thinking of buying his son a six-month movie pass for $40. With the pass, matinees cost $1.00. If matinees are normally $3.50 each, how many times must Jack attend in order for it to benefit his father to buy the pass?","Alex rode his bike for 2 hours travelling 23 miles. What is his speed(mph)?","Jane spent $42 for shoes.  This was $14 less than twice what she spent for a blouse.  How much was the blouse?","The sum of two numbers is 84, and one of them is 12 more than the other.  What are the two numbers?","The sum of 3 consecutive numbers is 39. Which equation can be used to solve for the numbers?"]
    let answers:[[String]] = [["5","4","20","2.5"],["7","49","9","5"],["5.67","6","2","10"],["2","8","10","15"],["49/5","5","20","196"],["5","10","6","2"],["-3","3","-5","15"],["-1","1","0","2"],["1","5","19","10"],["c=5h+8","c=8h+5","c=8h+5h","h=5+8c"],["16","40","2.5","24"],["11.5","23","46","2"],["28","56","70","84"],["36 and 48","70 and 14","24 and 12","30 and 54"],["All are correct","x+x+1+x+2=39","3x+3=39","3x=36"]]
    let explanations:[String]=["The order of operations is needed in order to solve this problem. Since parentheses comes first in the hierarchy, you have to perform 3 times 9 before you do anything else. This leaves us with 21÷3+27*9+5. Next, we need to do the muliplication and division because it is higher on the hierarchy than addition. Once we do the multiplication and division, we are left with 7+243+5. Now it is a simple addition problem, therefore the correct answer was 255.","test","lol","hi","bye","testing","a","bb","cc","dd","ee","ff","gg","hh","ii"]
    
    //labels
    
    @IBOutlet weak var questionLabel2: UILabel!
    @IBOutlet weak var score2: UILabel!
    
     override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
           if(segue.identifier == "popup2")
           {
                let popupvar = segue.destination as! PopupViewController
                popupvar.myString = result
                popupvar.questionnumber = currentQuestion
                popupvar.questioncount = questions.count
                popupvar.correctAnswer = answers[currentQuestion-1][0]
                popupvar.explain = explanations[currentQuestion-1]
                popupvar.score = points
                popupvar.topic = "Equations"
               
           }
       }
    @IBAction func button2(_ sender: Any) {
        if((sender as AnyObject).tag == Int(rightAnswerPlacement)){
            print("Right!")
            result="Correct"
            points += 1
            self.performSegue(withIdentifier: "popup2", sender: nil)
            
        }
        else{
            print("Wrong")
            result="Incorrect"
            self.performSegue(withIdentifier: "popup2", sender: nil)
        }
        if(currentQuestion != questions.count){
            newQuestion()
            score2.text = "Score: \(points)"
        }
        else{
            print("done")
            score2.text = "Score: \(points)"
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
        score2.text = "Score: \(points)"
     }
     func newQuestion()
     {
        questionLabel2.text = questions[currentQuestion]
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
    
   
