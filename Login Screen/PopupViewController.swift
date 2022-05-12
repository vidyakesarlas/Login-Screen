//
//  PopupViewController.swift
//  Login Screen
//
//  Created by vidya.k on 09/05/22.
//

import UIKit

class PopupViewController: UIViewController {

    
    @IBOutlet weak var dateTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)


               self.showAnimate()

               // Do any additional setup after loading the view.
        
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        
        dateTF.inputView = datePicker
        dateTF.text = formatDate(date: Date()) // todays Date
    }
    
    @objc func dateChange(datePicker: UIDatePicker)
    {
        dateTF.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }
        


             func showAnimate()
               {
                   self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                   self.view.alpha = 0.0;
                   UIView.animate(withDuration: 0.25, animations: {
                       self.view.alpha = 1.0
                       self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

                   });
               }

               func removeAnimate()
               {
                   UIView.animate(withDuration: 0.25, animations: {
                       self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                       self.view.alpha = 0.0;

                   }, completion:{(finished : Bool)  in
                       if (finished)
                       {
                           self.view.removeFromSuperview()
                       }
                   });
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
