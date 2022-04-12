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
            if email == "vidya@i-exceed.com" && password == "Appzillon@123"{
                self.performSegue(withIdentifier: "next" , sender: self)
            }else{
                let alertContoller = UIAlertController (title: "Unsuccesful login" , message: "Please enter valid credentials", preferredStyle: .alert)
                alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                present(alertContoller, animated: true, completion: nil)
            }
        }
    }
}

