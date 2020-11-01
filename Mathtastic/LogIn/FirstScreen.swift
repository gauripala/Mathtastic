//
//  FirstScreen.swift
//  LoginTesting
//
//  Created by Gauri Pala on 8/11/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController{
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "guest"{
            let popupvar = segue.destination as! HomeViewController
            popupvar.guest = "true"
            
        }
    }
    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
        
    }
}
