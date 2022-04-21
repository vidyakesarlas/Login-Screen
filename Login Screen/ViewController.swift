//
//  ViewController.swift
//  Login Screen
//
//  Created by vidya.k on 11/04/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var isEmailValid = false
    var isPasswordValid = false
    
    var networkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTxtField.delegate = self
        passwordTxtField.delegate = self
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 15
        
        self.userNameTxtField.layer.borderWidth = 2
        self.passwordTxtField.layer.borderWidth = 2
        self.userNameTxtField.layer.borderColor = UIColor.gray.cgColor
        self.passwordTxtField.layer.backgroundColor = UIColor.gray.cgColor
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
    
    
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        var mail = userNameTxtField.text!
        var pwd = passwordTxtField.text!
        
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
            isPasswordValid = pwd.isValidPassword
            
            if !isPasswordValid{
                self.passwordTxtField.layer.borderColor = UIColor.red.cgColor
                //                     let alertContoller2 = UIAlertController (title: "Password not valid" , message: "Please enter a password containing atleast 8 characters, one capital letter, one lower case letter, one digit and one special character ", preferredStyle: .alert)
                //                     alertContoller2.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                //                     present(alertContoller2, animated: true, completion: nil)
            } else {
                self.passwordTxtField.layer.borderColor = UIColor.gray.cgColor
            }
        }
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
     let loginSuccess = networkManager.callAPI(userCompletionHandler: { status in
            if status{
              //  print("HI")
                DispatchQueue.main.async {
                self.performSegue(withIdentifier: "next" , sender: self)
                }
            }
            else{
                
                DispatchQueue.main.async{
                let alertContoller = UIAlertController (title: "Unsuccessful login" , message: "Please enter valid credentials", preferredStyle: .alert)
                alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                self.present(alertContoller, animated: true, completion: nil)
                }
            }
        })
        
      
        
        
        //        if let email = userNameTxtField.text, let password = passwordTxtField.text{
        //            if email == "vidyakesarla@iexceed.com" && password == "Appzillon@123"{
        //                self.performSegue(withIdentifier: "next" , sender: self)
        //        }
        //            else{
        //                print("aa")
        //                let alertContoller = UIAlertController (title: "Unsuccessful login" , message: "Please enter valid credentials", preferredStyle: .alert)
        //                alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        //                present(alertContoller, animated: true, completion: nil)
        //            }
        //        }
    }
    
}



