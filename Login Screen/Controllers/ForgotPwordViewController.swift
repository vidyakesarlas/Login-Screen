//
//  ForgotPwordViewController.swift
//  Login Screen
//
//  Created by vidya.k on 14/06/22.
//

import UIKit

class ForgotPwordViewController: UIViewController {
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    var oldPassword: String = ""
    var isPasswordValid = false
    var networkManager = NetworkManager()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Reset password"
        // Do any additional setup after loading the view.
    }
    
    func callHome(){
        let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! ViewController
        self.navigationController?.pushViewController(homeVc, animated: true)
      //  self.present(homeVc, animated: true, completion: nil)
    }
    
    
    @IBAction func resetPassword(_ sender: Any) {
        let VC = ViewController()
        oldPassword = defaults.string(forKey: "userPassword")!
        print("oldpassword is --\(oldPassword)")
        isPasswordValid = ((newPasswordTextField.text?.isValidPassword()) != nil)
        if let reachability = try? Reachability(){
            if reachability.connection != .unavailable {
                if isPasswordValid == true{
                networkManager.callAPI(userCompletionHandler: { status in
                    if status{
                        DispatchQueue.main.async {
                            //self.defaults.set(self.userPassword, forKey: "userPassword")
                            self.defaults.set(self.newPasswordTextField.text, forKey: "userPassword")
                            self.callHome()
                        }
                        let alertContoller = UIAlertController (title: "Password changed successfully" , message: "Please enter the same password to login successfully", preferredStyle: .alert)
                        alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                        self.present(alertContoller, animated: true, completion: nil)
                    }
                    else{
                        DispatchQueue.main.async{
                           // self.passwordTxtField.layer.borderColor = UIColor.red.cgColor
                            let alertContoller = UIAlertController (title: "API CALL not successful" , message: "Please enter valid credentials", preferredStyle: .alert)
                            alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                            self.present(alertContoller, animated: true, completion: nil)
                        }
                    }
                })
            }
                else{
                    //self.passwordTxtField.layer.borderColor = UIColor.red.cgColor
                    let alertContoller = UIAlertController (title: "Password incorrect" , message: "Please enter a password which has atleast each one of caps, smallcase, numeric, special characters", preferredStyle: .alert)
                    alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                    self.present(alertContoller, animated: true, completion: nil)
                }
            }
            else {
                let alertContoller1 = UIAlertController (title: "No internet connection" , message: "Please check your internet", preferredStyle: .alert)
                alertContoller1.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                self.present(alertContoller1, animated: true, completion: nil)
            }
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
}
