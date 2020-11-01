//
//  ArithmeticViewController.swift
//  MathApp
//
//  Created by Gauri Pala on 3/11/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit

class ArithmeticViewController: UIViewController {
    
    let questions:[String] = ["21÷3+(3×9)×9+5","18÷6×(4-3)+6","14-8+3+8×(24÷8)","4×5+(14+8)-36÷9","(17-7)×6+2+56-8","(28÷4)+3+(10-8)×5","12-5+6×3+20÷4","36÷9+48-10÷2","10+8×90÷9-4","8×3+70÷7-7","The temperature at the top of a mountain is 10.8°C less than the temperature at the base of the mountain. If the temperature at the base is −4.4°C, what is the temperature at the top?","Which number is rational?","Rational numbers cannot...","Which number is irrational?"]
    let answers:[[String]] = [["255","476","20","2.5"],["9","2","7","5"],["33","14","2","10"],["38","26","35","10"],["110","100","57","55"],["20","15","17","4"],["30","16","18","10"],["47","40","14","30"],["86","56","90","20"],["27","6","18","50"],["−15.2°C","6.4°C","15.2°C","–6.4°C"],["2/3","Pi","Squareroot of 5",".12131415..."],["go on forever without repeating","repeat","go on forever","be negative"],["Squareroot of 3","9/500","-.9","7/9"]]
    let explanations:[String]=["The order of operations is needed in order to solve this problem. Since parentheses comes first in the hierarchy, you have to perform 3 times 9 before you do anything else. This leaves us with 21÷3+27*9+5. Next, we need to do the muliplication and division because it is higher on the hierarchy than addition. Once we do the multiplication and division, we are left with 7+243+5. Now it is a simple addition problem, therefore the correct answer was 255.","The order of operations is needed in order to solve this problem. Since parentheses comes first in the hierarchy, you have to perform 4 minus 3 before you do anything else. This leaves us with 18÷6×1+6. Next, we need to do the muliplication and division because it is higher on the hierarchy than addition. Once we do the multiplication and division, we are left with 3+6. Now it is a simple addition problem, therefore the correct answer was 9.","The order of operations is needed in order to solve this problem. Since parentheses comes first in the hierarchy, you have to perform 24 divided by 8 before you do anything else. This leaves us with 14-8+3+8×3. Next, we need to do the muliplication and division because it is higher on the hierarchy than addition. Once we do the multiplication and division, we are left with 14-8+3+24. Now it is a simple addition problem, therefore the correct answer was 33.","The order of operations is needed in order to solve this problem. Since parentheses comes first in the hierarchy, you have to perform 14 plus 8 before you do anything else. This leaves us with 4×5+22-36÷9. Next, we need to do the muliplication and division because it is higher on the hierarchy than addition. Once we do the multiplication and division, we are left with 20+22-4. Now it is a simple addition problem, therefore the correct answer was 38.","The order of operations is needed in order to solve this problem. Since parentheses comes first in the hierarchy, you have to perform 17 minus 7 before you do anything else. This leaves us with 10×6+2+56-8. Next, we need to do the muliplication and division because it is higher on the hierarchy than addition. Once we do the multiplication and division, we are left with 60+2+56-8. Now it is a simple addition problem, therefore the correct answer was 110.","testing","a","bb","cc","dd","ee","ff","gg","hh"]
    
    //Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    var pointstext = ""
    var result = ""
    var guest = ""
    //Label
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var score: UILabel!
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        if(segue.identifier == "popup")
        {
            let popupvar = segue.destination as! PopupViewController
            popupvar.myString = result
            popupvar.questionnumber = currentQuestion
            popupvar.questioncount = questions.count
            popupvar.correctAnswer = answers[currentQuestion-1][0]
            popupvar.explain = explanations[currentQuestion-1]
            popupvar.score = points
            popupvar.topic = "Basic Arithmetic"
        }
        
    }
    var button:UIButton = UIButton()
    var y = 1
    //Button
    @IBAction func action(_ sender: AnyObject) {
        if((sender as AnyObject).tag == Int(rightAnswerPlacement))
        {
            print("Right!")
            result="Correct"
            points += 1
            self.performSegue(withIdentifier: "popup", sender: nil)
            
            
        }
        else{
            print("Wrong")
            result="Incorrect"
            self.performSegue(withIdentifier: "popup", sender: nil)
            
        }
        if(currentQuestion != questions.count)
        {
            newQuestion()
            score.text = "Score: \(points)"
          
        }
        else
        {
            print("done")
            score.text = "Score: \(points)"
            
            
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
        score.text = "Score: \(points)"
    }
    //new question
    func newQuestion()
    {
        button.backgroundColor = UIColor.systemTeal
        lbl.text = questions[currentQuestion]
        rightAnswerPlacement = arc4random_uniform(4)+1
        
        //create button
        var x = 1
        for i:Int in 1...4
        {
            if button != nil{
                button = view.viewWithTag(i) as! UIButton
            }
            if(i==Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x += 1
                
            }
            
        }
        currentQuestion += 1
        
    }
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
