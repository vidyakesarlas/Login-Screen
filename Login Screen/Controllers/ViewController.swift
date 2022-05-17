//
//  ViewController.swift
//  Login Screen
//
//  Created by vidya.k on 11/04/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var isEmailValid = false
    var isPasswordValid = false
    
    var networkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueView.layer.cornerRadius = 55
        self.navigationController?.isNavigationBarHidden = true
        userNameTxtField.delegate = self
        passwordTxtField.delegate = self
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 15
        
        self.userNameTxtField.layer.borderWidth = 2
        self.passwordTxtField.layer.borderWidth = 2
        self.userNameTxtField.layer.borderColor = UIColor.gray.cgColor
        self.passwordTxtField.layer.backgroundColor = UIColor.gray.cgColor
        
        let pwd = "Aq9@)!(@21"
        let x = pwd.isValidPassword()
        print("is true--- ?\(x)")
        
        
    }
    
    //MARK: Textfield delegate methods
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == self.userNameTxtField{
            self.userNameTxtField.layer.borderColor = UIColor.gray.cgColor
        }
        else if textField == self.passwordTxtField{
            self.passwordTxtField.layer.borderColor = UIColor.gray.cgColor
        }
        return true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        return true;
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let mail = userNameTxtField.text!
        let pwd = passwordTxtField.text!
        
        if textField == self.userNameTxtField{
            isEmailValid = mail.isValidEmail
            if isEmailValid == false{
                self.userNameTxtField.layer.borderColor = UIColor.red.cgColor
                //                         let alertContoller1 = UIAlertController (title: "Email ID is either incorrect or not valid" , message: "Please enter a mail ID which is of the format - user@domain.com or firstname.lastname@domain.com", preferredStyle: .alert)
                //                         alertContoller1.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                //                         present(alertContoller1, animated: true, completion: nil)
            }
            else{
                self.passwordTxtField.layer.borderColor = UIColor.gray.cgColor
            }
        }
        
        if textField == self.passwordTxtField {
            isPasswordValid = pwd.isValidPassword()
            
            if isPasswordValid == false{
                print("PASSWORD NOT VALID")
                
                self.passwordTxtField.layer.borderColor = UIColor.red.cgColor
                
            } else {
                self.passwordTxtField.layer.borderColor = UIColor.gray.cgColor
            }
        }
        
    }
    
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        //    self.passwordTxtField.layer.borderColor = UIColor.gray.cgColor
        
        networkManager.callAPI(userCompletionHandler: { status in
            if status{
                
                //  print("HI")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "next" , sender: self)
                }
            }
            else{
                
                DispatchQueue.main.async{
                    self.passwordTxtField.layer.borderColor = UIColor.red.cgColor
                    let alertContoller = UIAlertController (title: "Unsuccessful login" , message: "Please enter valid credentials", preferredStyle: .alert)
                    alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                    self.present(alertContoller, animated: true, completion: nil)
                }
            }
        })
        
    }
    
}


