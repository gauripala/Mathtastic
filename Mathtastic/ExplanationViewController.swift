//
//  Explanation.swift
//  MathApp
//
//  Created by Gauri Pala on 8/1/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit

class ExplanationViewController: UIViewController{
    
    var explanations = String()
    var qcount = 0
    var qnumber = 0
    var scores = 0
    var topics = ""
    @IBOutlet weak var explanation: UILabel!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="yesend"){
            let yesvar = segue.destination as! EndViewController
            yesvar.points1 = String(scores)
            yesvar.topicname = topics
        }
    }
    @IBAction func igotit(_ sender: Any) {
        if(qcount == qnumber)
        {
            self.performSegue(withIdentifier: "yesend", sender: self)
        }
        else{
            self.presentingViewController!.presentingViewController!.dismiss(animated: false, completion: nil)
        }
    }
    override func viewDidLoad() {
        explanation.text = explanations
    }
    
    
}
