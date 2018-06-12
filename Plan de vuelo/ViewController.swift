//
//  ViewController.swift
//  Plan de vuelo
//
//  Created by Felipe Corro on 21/05/2018.
//  Copyright © 2018 Felipe Corro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: Actions
    @IBAction func logIn(_ sender: Any) {
        if(emailTextField.text == "santiago.corro@gmail.com" &&
            passwordTextField.text == "123456") {
                print("You are IN! 👍")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

