//
//  ViewController.swift
//  Login Screen
//
//  Created by vidya.k on 11/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton
        .layer.cornerRadius = 15    }


    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = userName.text, let password = password.text{
            if email == "abc@gmail.com" && password == "ABC123"{
                self.performSegue(withIdentifier: "next" , sender: self)
            }else{
             print("UNSUCCESSFUL LOGIN")
            }
        }
    }
}

