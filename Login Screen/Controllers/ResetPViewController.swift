//
//  ResetPViewController.swift
//  Login Screen
//
//  Created by vidya.k on 16/06/22.
//

import UIKit

class ResetPViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var emailIDTextField: UITextField!
    var networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        emailIDTextField.layer.cornerRadius = 5
        emailIDTextField.clipsToBounds = true
        sendButton.layer.cornerRadius = 15
        //.font(.system(size: 30, weight: .bold, design: .default))
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationItem.setHidesBackButton(false, animated: true)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    func callHome(){
        let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPassword") as! ForgotPwordViewController
        self.navigationController?.pushViewController(homeVc, animated: true)
    }
    
    @IBAction func sendInstructions(_ sender: Any) {
       
        if let reachability = try? Reachability(){
            if reachability.connection != .unavailable {
                if ((emailIDTextField.text?.isValidEmail) == true){
                networkManager.callAPI(userCompletionHandler: { status in
                    if status{
                        DispatchQueue.main.async {
                            self.callHome()
                        }
                        let alertContoller = UIAlertController (title: "Instructions to reset password has been sent successfully to your email address" , message: "Create a new password", preferredStyle: .alert)
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
                    let alertContoller = UIAlertController (title: "Mail incorrect" , message: "Please enter a mail which is of format user@some-mail.com", preferredStyle: .alert)
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
                    
