//
//  PopUpWindow.swift
//  Login Screen
//
//  Created by vidya.k on 09/05/22.
//

import Foundation
import UIKit

protocol PopUpWindowManager: AnyObject{
    func okButtonPressed(index: Int)
}

class PopUpWindow: UIViewController {
    var cellIndex: Int = 0
    weak var delegate: PopUpWindowManager?
    static var date: String = ""
    var okSelect: Bool = false
    
    @IBOutlet weak var dateTF: UITextField!
    private let popUpWindowView = PopUpWindowView()
    private var myDatePicker: UIDatePicker?
    
    init(title: String, text: String, buttontext: String, datePicker: UIDatePicker, button: String) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        popUpWindowView.popupTitle.text = title
        popUpWindowView.popupText.text = text
        popUpWindowView.popupButton.setTitle(buttontext, for: .normal)
        popUpWindowView.popupButton.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
        popUpWindowView.popupButton2.setTitle(button, for: .normal)
        popUpWindowView.popupButton2.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        view = popUpWindowView
        self.myDatePicker = datePicker
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        dateTF?.inputView = datePicker
        dateTF?.text = formatDate(date: Date())
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func okButtonPressed(){
        self.popUpWindowView.popupText.text = "APPOINTMENT BOOKED!"
        print("date selected........:\(popUpWindowView.popupDate.date)")
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: popUpWindowView.popupDate.date)
        let minutes = calendar.component(.minute, from: popUpWindowView.popupDate.date)
        let dateStr = formatDate(date: popUpWindowView.popupDate.date)
        let timeStr = (String(format: "%0.2d:%0.2d",hour,minutes))
        print(hour)
        print(minutes)
        DoctorsViewController.datePicked = dateStr
        DoctorsViewController.datePick = popUpWindowView.popupDate.date
        DoctorsViewController.timePciked = timeStr
        delegate?.okButtonPressed(index: cellIndex)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func dismissView(){
        self.dismiss(animated: true, completion: nil)
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
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        // Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        print("Selected value \(selectedDate)")
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        print("date pciked is:\(popUpWindowView.popupDate.date)")
    }
}

private class PopUpWindowView: UIView {
    let popupView = UIView(frame: CGRect.zero)
    let popupTitle = UILabel(frame: CGRect.zero)
    let popupText = UILabel(frame: CGRect.zero)
    let popupButton = UIButton(frame: CGRect.zero)
    let popupDate = UIDatePicker(frame: CGRect.zero)
    let popupButton2 = UIButton(frame: CGRect.zero)
    let BorderWidth: CGFloat = 2.0
    @objc func doneButton(sender:UIButton)
    {
        popupDate.resignFirstResponder() // To resign the inputView on clicking done.
    }
    
    @objc func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }
    
    func getTime(sender:UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        let endDate = (sender.date).addingTimeInterval(TimeInterval(30.0 * 60.0))
        let time = dateFormatter.string(from: endDate)
        //  print("\(time)”) //getting current time like 8:14 AM , expected should be 8:00 AM
    }
    
    init() {
        super.init(frame: CGRect.zero)
        // Semi-transparent background
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        //  UIColor.colorFromHex("#BC214B")
        // Popup Background
        popupView.layer.backgroundColor = UIColor.systemBlue.cgColor
        popupView.layer.borderWidth = BorderWidth
        popupView.layer.masksToBounds = true
        popupView.layer.borderColor = UIColor.systemBlue.cgColor
        popupView.layer.cornerRadius = 8.0
        popupView.layer.masksToBounds = true
        
        // Popup Title
        popupTitle.textColor = UIColor.white
        //  popupTitle.backgroundColor = UIColor.colorFromHex("#9E1C40")
        popupTitle.layer.masksToBounds = true
        popupTitle.adjustsFontSizeToFitWidth = true
        popupTitle.clipsToBounds = true
        popupTitle.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        popupTitle.numberOfLines = 1
        popupTitle.textAlignment = .center
        
        // Popup Text
        popupText.textColor = UIColor.white
        popupText.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        popupText.numberOfLines = 0
        popupText.textAlignment = .center
        
        // Popup Button
        popupButton.setTitleColor(UIColor.white, for: .normal)
        // popupButton.backgroundColor = UIColor.green
        
        //Popup button 2
        popupButton2.setTitleColor(UIColor.white, for: .normal)
        popupButton2.titleLabel?.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        // popupButton2.backgroundColor = UIColor.red
        
        //Popup datepicker
        popupDate.minimumDate = Date()
        popupDate.frame = CGRect(x: 10, y: 50, width: self.popupView.frame.width, height: 200)
        // Set some of UIDatePicker properties
        popupDate.timeZone = NSTimeZone.local
        popupDate.overrideUserInterfaceStyle = .dark
        
        // Add DataPicker to the view
        self.popupView.addSubview(popupDate)
        popupView.addSubview(popupTitle)
        popupView.addSubview(popupText)
        popupView.addSubview(popupButton)
        popupView.addSubview(popupButton2)
        
        // Add the popupView(box) in the PopUpWindowView (semi-transparent background)
        addSubview(popupView)
        // PopupView constraints
        popupView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //            popupView.heightAnchor.constraint(equalToConstant: 500),
            popupView.widthAnchor.constraint(equalToConstant: 293),
            popupView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            popupView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        // PopupTitle constraints
        popupTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popupTitle.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
            popupTitle.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth),
            popupTitle.topAnchor.constraint(equalTo: popupView.topAnchor, constant: BorderWidth),
            popupTitle.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        // PopupText constraints
        popupText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popupText.heightAnchor.constraint(greaterThanOrEqualToConstant: 65),
            popupText.topAnchor.constraint(equalTo: popupTitle.bottomAnchor, constant: 40),
            popupText.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 15),
            popupText.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -15),
            popupText.bottomAnchor.constraint(equalTo: popupButton.topAnchor, constant: -40)
        ])
        
        // PopupButton constraints
        popupButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popupButton.heightAnchor.constraint(equalToConstant: 44),
            popupButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 150),
            popupButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: 0),
            popupButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -BorderWidth - 20)
        ])
        
        //popupbutton2 constraints
        popupButton2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popupButton2.heightAnchor.constraint(equalToConstant: 44),
            popupButton2.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 0),
            popupButton2.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -150),
            
            popupButton2.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -BorderWidth - 20)
        ])
        
        //popupdate constraints
        popupDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popupDate.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
            popupDate.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth - 38),
            popupDate.topAnchor.constraint(equalTo: popupView.topAnchor, constant: BorderWidth + 60),
            popupDate.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
