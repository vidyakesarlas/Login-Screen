//
//  DoctorsViewController.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import UIKit


class DoctorsViewController: UIViewController, UITableViewDataSource, UIPopoverPresentationControllerDelegate, MyTableViewCellDelegate, PopUpWindowManager {
    
    var docType: String?
    var okSelected: Bool = false
    var popUpWindow: PopUpWindow!
    static var datePicked:  String = ""
    static var timePciked: String = ""
    
    static var datePick: Date = Date()
    
    func okButtonPressed(index: Int) {

        popUpWindow.dismissView()
    
        let alertContoller = UIAlertController (title: "Appointment booked!" , message: "You've booked an appointment for the date \(DoctorsViewController.datePicked) and time \(DoctorsViewController.timePciked) hours", preferredStyle: .alert)
        alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        self.present(alertContoller, animated: true, completion: nil)
        
        switch docType {
            
        case "Dental Care":
            let dentist = self.dentists[index]
            dentist.appmtBooked = true

            
        case "Skin & Hair":
            let dermatologist = self.dermatalogists[index]
            dermatologist.appmtBooked = true
            
        case "Digestive Issues":
            let digestive = self.digestives[index]
            digestive.appmtBooked = true
          
        case "Ear Nose Throat":
            
            let ent = self.ents[index]
            ent.appmtBooked = true

            
            
        case "Eye Specialist":
            
            let eye = self.eyespecialists[index]
            eye.appmtBooked = true

        case "Child Specialist":
            
            let childSpecialist = self.childspecialists[index]
            childSpecialist.appmtBooked = true
           
        case "Women's Health":
            
            let gynaecologist = self.gynaecologists[index]
            gynaecologist.appmtBooked = true
         
        case "Homeopathy":
            
            let homeopathist = self.homeopathists[index]
            homeopathist.appmtBooked = true
            
        case "Bone & Joints":
            
            let orthopaedecian = self.orthopaedicians[index]
            orthopaedecian.appmtBooked = true
            
        case "Mental Wellness":
            
            let pshychiatrist = self.psychiatrists[index]
            pshychiatrist.appmtBooked = true
        case "Sex Specialist":
            
            let sexSpecialist = self.sexspecialists[index]
            sexSpecialist.appmtBooked = true
            
        case "General Physician":
            
            let physician = self.physicians[index]
            physician.appmtBooked = true
           
        default:
            print("none")
        }
 
        doctorTableView.reloadData()

    }
    

    func didTapButton(with title: String, index: Int) {
        
        print("title: \(title)")
        
        let date = UIDatePicker()
   
        popUpWindow = PopUpWindow(title: "Select date", text: "Choose a date and time convenient for you", buttontext: "OK", datePicker: date, button: "Cancel")
        
        popUpWindow.delegate = self
        
        print("index: \(index)")
        
        popUpWindow.cellIndex = index

        self.present(popUpWindow, animated: true, completion: nil)

    }

    @IBOutlet weak var doctorTableView: UITableView!
    
    
    var dentists: [Doctors] = [Doctors(image: "Harshitha", name: "Harshitha", yrs: "10", designation: "Dental Care", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 600 - Consultation fees" ),
                               Doctors(image: "Jaya", name: "Jaya", yrs: "10", designation: "Dental Care", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 650 - Consultation fees" ),
                               Doctors(image: "Yashaswini", name: "Yashaswini", yrs: "2", designation: "Dental Care", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 700 - Consultation fees" ),
                               Doctors(image: "Vidya", name: "Vidya", yrs: "5", designation: "Dental Care", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 500 - Consultation fees" ),
                               Doctors(image: "Kshema", name: "Kshema", yrs: "3", designation: "Dental Care", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 400 - Consultation fees" ),
                               Doctors(image: "Sunidhi", name: "Sunidhi", yrs: "2", designation: "Dental Care", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 300 - Consultation fees" ),
                               Doctors(image: "Sushma", name: "Sushma", yrs: "1", designation: "Dental Care", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 500 - Consultation fees" ),
                               Doctors(image: "Lakshmi", name: "Lakshmi", yrs: "5", designation: "Dental Care", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 450 - Consultation fees" ),
                               Doctors(image: "Anne", name: "Anne", yrs: "4", designation: "Dental Care", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 380 - Consultation fees" ),
                               Doctors(image: "Harsha", name: "Harsha", yrs: "9", designation: "Dental Care", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 700 - Consultation fees" )
                               
    ]
    
    
    var dermatalogists: [Doctors] = [Doctors(image: "Mohini", name: "Mohini", yrs: "10", designation: "Dermatology", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 600 - Consultation fees" ),
                                     Doctors(image: "Sushma", name: "Sushma", yrs: "10", designation: "Dermatology", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 650 - Consultation fees" ),
                                     Doctors(image: "Lakshmi", name: "Lakshmi", yrs: "2", designation: "Dermatology", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 750 - Consultation fees" ),
                                     Doctors(image: "Bhavya", name: "Bhavya", yrs: "5", designation: "Dermatology", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 450 - Consultation fees" ),
                                     Doctors(image: "Vandita", name: "Vandita", yrs: "3", designation: "Dermatology", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 550 - Consultation fees" ),
                                     Doctors(image: "Nirmala", name: "Nirmala", yrs: "2", designation: "Dermatology", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 700 - Consultation fees" ),
                                     Doctors(image: "Trupthi", name: "Trupthi", yrs: "1", designation: "Dermatology", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 800 - Consultation fees" ),
                                     Doctors(image: "Disha", name: "Disha", yrs: "5", designation: "Dermatology", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 350 - Consultation fees" ),
                                     Doctors(image: "Srushty", name: "Srushty", yrs: "4", designation: "Dermatology", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 400 - Consultation fees" ),
                                     Doctors(image: "Kala", name: "Kala", yrs: "9", designation: "Dermatology", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 500 - Consultation fees" )
                                     
    ]
    
    var digestives: [Doctors] = [Doctors(image: "Varshitha", name: "Varshitha", yrs: "10" , designation: "Digestive Issues", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 500 - Consultation fees"),
                                 Doctors(image: "Ramya", name: "Ramya", yrs: "10", designation: "Digestive Issues", address: "Indiranagar KFC, Vikas Clinic", fees: "~ Rs 500 - Consultation fees"),
                                 Doctors(image: "Mohan", name: "Mohan", yrs: "2", designation: "Digestive Issues", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 600 - Consultation fees"),
                                 Doctors(image: "Sundaran", name: "Sundaran", yrs: "5", designation: "Digestive Issues", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 400 - Consultation fees"),
                                 Doctors(image: "Vivek", name: "Vivek", yrs: "3", designation: "Digestive Issues", address: "Indiranagar KFC, Vikas Clinic", fees: "~ Rs 300 - Consultation fees"),
                                 Doctors(image: "Vidya", name: "Vidya", yrs: "2", designation: "Digestive Issues", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 800 - Consultation fees"),
                                 Doctors(image: "Srikanth", name: "Srikanth", yrs: "8", designation: "Digestive Issues", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 550 - Consultation fees"),
                                 Doctors(image: "Srinivas", name: "Srinivas", yrs: "5", designation: "Digestive Issues", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                 Doctors(image: "Srushty", name: "Srushty", yrs: "4", designation: "Digestive Issues", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 400 - Consultation fees" ),
                                 Doctors(image: "Kala", name: "Kala", yrs: "9", designation: "Digestive Issues", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 500 - Consultation fees" )
                                 
                                 
                                 
                                 
    ]
    
    var ents: [Doctors] = [Doctors(image: "John", name: "John", yrs: "10", designation: "Ear Nose Throat", address: "Adugodi 5 block, BGS Clinic", fees: "~ Rs 600 - Consultation fees"),
                           
                           Doctors(image: "Nagarjuna", name: "Nagarjuna", yrs: "2", designation: "Ear Nose Throat", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 600 - Consultation fees"),
                           Doctors(image: "Vikram", name: "Vikram", yrs: "5", designation: "Ear Nose Throat", address: "Adugodi 5 block, BGS Clinic", fees: "~ Rs 700 - Consultation fees"),
                           Doctors(image: "Abheetha", name: "Abheetha", yrs: "3", designation: "Ear Nose Throat", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 650 - Consultation fees"),
                           
                           Doctors(image: "Raghav", name: "Raghav", yrs: "4", designation: "Ear Nose Throat", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 400 - Consultation fees"),
                           Doctors(image: "Spoorthy", name: "Spoorthy", yrs: "9", designation: "Ear Nose Throat", address: "Adugodi 5 block, BGS Clinic", fees: "~ Rs 350 - Consultation fees"),
                           Doctors(image: "Sunidhi", name: "Sunidhi", yrs: "2", designation: "Ear Nose Throat", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 200 - Consultation fees"),
                           Doctors(image: "Arundati", name: "Arundati", yrs: "1", designation: "Ear Nose Throat", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 300 - Consultation fees"),
                           Doctors(image: "Reena", name: "Reena", yrs: "5", designation: "Ear Nose Throat", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 750 - Consultation fees"),
                           Doctors(image: "Shanti", name: "Shanti", yrs: "4", designation: "Ear Nose Throat", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 200 - Consultation fees")
                           
    ]
    
    var eyespecialists: [Doctors] = [Doctors(image: "Prajwal", name: "Prajwal", yrs: "10", designation: "Eye Specialist", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 350 - Consultation fees"),
                                     Doctors(image: "Vineeth", name: "Vineeth", yrs: "10", designation: "Eye Specialist", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 350 - Consultation fees"),
                                     Doctors(image: "Shwetha", name: "Shwetha", yrs: "2", designation: "Eye Specialist", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                     Doctors(image: "Sathish", name: "Sathish", yrs: "5", designation: "Eye Specialist", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 550 - Consultation fees"),
                                     Doctors(image: "Rose", name: "Rose", yrs: "3", designation: "Eye Specialist", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 350 - Consultation fees"),
                                     Doctors(image: "Sunidhi", name: "Sunidhi", yrs: "2", designation: "Eye Specialist", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 200 - Consultation fees"),
                                     Doctors(image: "Arundati", name: "Arundati", yrs: "1", designation: "Eye Specialist", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 300 - Consultation fees"),
                                     Doctors(image: "Reena", name: "Reena", yrs: "5", designation: "Eye Specialist", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 750 - Consultation fees"),
                                     Doctors(image: "Shanti", name: "Shanti", yrs: "4", designation: "Eye Specialist", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 200 - Consultation fees"),
                                     Doctors(image: "dummy-doctor1", name: "Bairya", yrs: "9", designation: "Eye Specialist", address: "Kengeri Satellite Town, Nethralaya Clinic", fees: "~ Rs 650 - Consultation fees")
                                     
    ]
    
    var childspecialists: [Doctors] = [
        Doctors(image: "Pranitha", name: "Pranitha", yrs: "10", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 650 - Consultation fees"),
        Doctors(image: "Prajwal", name: "Prajwal", yrs: "2", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 600 - Consultation fees"),
        Doctors(image: "Olivia", name: "Olivia", yrs: "5", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 400 - Consultation fees"),
        Doctors(image: "Mary", name: "Mary", yrs: "3", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 750 - Consultation fees"),
        Doctors(image: "Madhusudhan", name: "Madhusudhan", yrs: "2", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 550 - Consultation fees"),
        Doctors(image: "Divya", name: "Divya", yrs: "1", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 400 - Consultation fees"),
        Doctors(image: "Lakshmi", name: "Lakshmi", yrs: "5", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 350 - Consultation fees"),
        Doctors(image: "Deepa", name: "Deepa", yrs: "4", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 700 - Consultation fees"),
        Doctors(image: "Akhtar", name: "Akhtar", yrs: "9", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 800 - Consultation fees"),
        Doctors(image: "Akhtar", name: "Akhtar", yrs: "9", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 800 - Consultation fees")
        
    ]
    
    
    var gynaecologists: [Doctors] = [Doctors(image: "Ron", name: "Ron", yrs: "10", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 800 - Consultation fees"),
                                     Doctors(image: "Harish", name: "Harish", yrs: "10", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 750 - Consultation fees"),
                                     Doctors(image: "Sushma", name: "Sushma", yrs: "2", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 600 - Consultation fees"),
                                     Doctors(image: "Hermoine", name: "Hermoine", yrs: "5", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 500 - Consultation fees"),
                                     Doctors(image: "Harry", name: "Harry", yrs: "3", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                     Doctors(image: "Enid", name: "Enid", yrs: "2", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 300 - Consultation fees"),
                                     Doctors(image: "Enid", name: "Enid", yrs: "2", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 300 - Consultation fees"),
                                     Doctors(image: "Enid", name: "Enid", yrs: "2", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 300 - Consultation fees"),
                                     Doctors(image: "Enid", name: "Enid", yrs: "2", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 300 - Consultation fees"),
                                     Doctors(image: "Enid", name: "Enid", yrs: "2", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 300 - Consultation fees")
                                     
                                     
    ]
    
    var homeopathists: [Doctors] = [Doctors(image: "Vikrant", name: "Vikrant", yrs: "10", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 800 - Consultation fees"),
                                    Doctors(image: "Riya", name: "Riya", yrs: "10", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 700 - Consultation fees"),
                                    Doctors(image: "Sahana", name: "Sahana", yrs: "2", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 600 - Consultation fees"),
                                    Doctors(image: "Rakshitha", name: "Rakshitha", yrs: "5", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 500 - Consultation fees"),
                                    Doctors(image: "Spoorthy", name: "Spoorthy", yrs: "3", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 650 - Consultation fees"),
                                    Doctors(image: "Sarvadarshi", name: "Sarvadarshi", yrs: "2", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 700 - Consultation fees"),
                                    Doctors(image: "Navya", name: "Navya", yrs: "1", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                    Doctors(image: "Namratha", name: "Namratha", yrs: "5", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 600 - Consultation fees"),
                                    Doctors(image: "Manish", name: "Manish", yrs: "4", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 700 - Consultation fees"),
                                    Doctors(image: "Ujjwal", name: "Ujjwal", yrs: "9", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 550 - Consultation fees")
                                    
    ]
    
    var orthopaedicians: [Doctors] = [Doctors(image: "Akshay", name: "Akshay", yrs: "10", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                      Doctors(image: "Ashritha", name: "Ashritha", yrs: "10", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                      Doctors(image: "Gokul", name: "Gokul", yrs: "2", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                      Doctors(image: "dummy-doctor1", name: "Eshanye", yrs: "5", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                      Doctors(image: "Tafseer", name: "Tafseer", yrs: "3", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                      Doctors(image: "Sunil", name: "Sunil", yrs: "2", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                      Doctors(image: "Rishabh", name: "Rishabh", yrs: "1", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                      Doctors(image: "sourav", name: "sourav", yrs: "5", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                      Doctors(image: "Bhavya", name: "Bhavya", yrs: "4", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees"),
                                      Doctors(image: "dummy-doctor1", name: "Pooja", yrs: "9", designation: "Homeopathist", address: "Attiguppe, Kiya Clinic", fees: "~ Rs 450 - Consultation fees")
                                      
    ]
    
    var psychiatrists: [Doctors] = [Doctors(image: "Sanjay", name: "Sanjay", yrs: "10", designation: "Psychiatrist", address: "Halasuru, Margos Clinic", fees: "~ Rs 450 - Consultation fees"),
                                    Doctors(image: "dummy-doctor1", name: "sheeshir", yrs: "10", designation: "Psychiatrist", address: "Halasuru, Margos Clinic", fees: "~ Rs 500 - Consultation fees"),
                                    Doctors(image: "Jagadeesh", name: "Jagadeesh", yrs: "2", designation: "Psychiatrist", address: "Halasuru, Margos Clinic", fees: "~ Rs 600 - Consultation fees"),
                                    Doctors(image: "Girish", name: "Girish", yrs: "5", designation: "Psychiatrist", address: "Halasuru, Margos Clinic", fees: "~ Rs 450 - Consultation fees"),
                                    Doctors(image: "Rajalakshmi", name: "Rajalakshmi", yrs: "3", designation: "Psychiatrist", address: "Halasuru, Margos Clinic", fees: "~ Rs 750 - Consultation fees"),
                                    Doctors(image: "Ranjan", name: "Ranjan", yrs: "2", designation: "Psychiatrist", address: "Halasuru, Margos Clinic", fees: "~ Rs 650 - Consultation fees"),
                                    Doctors(image: "dummy-doctor1", name: "Rakshith", yrs: "1", designation: "Psychiatrist", address: "Halasuru, Margos Clinic", fees: "~ Rs 350 - Consultation fees"),
                                    Doctors(image: "dummy-doctor1", name: "Catherine", yrs: "5", designation: "Psychiatrist", address: "Halasuru, Margos Clinic", fees: "~ Rs 500 - Consultation fees"),
                                    Doctors(image: "dummy-doctor1", name: "Priyanka", yrs: "4", designation: "Psychiatrist", address: "Halasuru, Margos Clinic", fees: "~ Rs 600 - Consultation fees"),
                                    Doctors(image: "dummy-doctor1", name: "Parineeti", yrs: "9", designation: "Psychiatrist", address: "Halasuru, Margos Clinic", fees: "~ Rs 700 - Consultation fees")
                                    
    ]
    
    
    var physicians: [Doctors] = [Doctors(image: "dummy-doctor1", name: "Deepika", yrs: "10", designation: "Physician", address: "Trinity, Keshav's Clinic", fees: "~ Rs 450 - Consultation fees"),
                                 Doctors(image: "dummy-doctor1", name: "Bheem", yrs: "10", designation: "Physician", address: "Trinity, Keshav's Clinic", fees: "~ Rs 500 - Consultation fees"),
                                 Doctors(image: "Ameeth", name: "Ameeth", yrs: "2", designation: "Physician", address: "Trinity, Keshav's Clinic", fees: "~ Rs 450 - Consultation fees"),
                                 Doctors(image: "Ashutosh", name: "Ashutosh", yrs: "5", designation: "Physician", address: "Trinity, Keshav's Clinic", fees: "~ Rs 600 - Consultation fees"),
                                 Doctors(image: "Fernandez", name: "Fernandez", yrs: "3", designation: "Physician", address: "Trinity, Keshav's Clinic", fees: "~ Rs 700 - Consultation fees"),
                                 Doctors(image: "Sohaib", name: "Sohaib", yrs: "2", designation: "Physician", address: "Trinity, Keshav's Clinic", fees: "~ Rs 450 - Consultation fees"),
                                 Doctors(image: "Sukumar", name: "Sukumar", yrs: "1", designation: "Physician", address: "Trinity, Keshav's Clinic", fees: "~ Rs 800 - Consultation fees"),
                                 Doctors(image: "dummy-doctor1", name: "Nidhi", yrs: "5", designation: "Physician", address: "Trinity, Keshav's Clinic", fees: "~ Rs 350 - Consultation fees"),
                                 Doctors(image: "Chirantan", name: "Chirantan", yrs: "4", designation: "Physician", address: "Trinity, Keshav's Clinic", fees: "~ Rs 500 - Consultation fees"),
                                 Doctors(image: "Tarun", name: "Tarun", yrs: "9", designation: "Physician", address: "Trinity, Keshav's Clinic", fees: "~ Rs 600 - Consultation fees")
                                 
    ]
    
    var sexspecialists: [Doctors] = [Doctors(image: "dummy-doctor1", name: "Dimple", yrs: "10", designation: "Sex Specialist", address: "Domlur, One time Clinic", fees: "~ Rs 600 - Consultation fees"),
                                     Doctors(image: "dummy-doctor1", name: "Kumar", yrs: "10", designation: "Sex Specialist", address: "Domlur, One time Clinic", fees: "~ Rs 450 - Consultation fees"),
                                     Doctors(image: "dummy-doctor1", name: "Manu", yrs: "2", designation: "Sex Specialist", address: "Domlur, One time Clinic", fees: "~ Rs 500 - Consultation fees"),
                                     Doctors(image: "dummy-doctor1", name: "Jagannath", yrs: "5", designation: "Sex Specialist", address: "Domlur, One time Clinic", fees: "~ Rs 700 - Consultation fees"),
                                     Doctors(image: "dummy-doctor1", name: "Vishnu", yrs: "3", designation: "Sex Specialist", address: "Domlur, One time Clinic", fees: "~ Rs 500 - Consultation fees"),
                                     Doctors(image: "dummy-doctor1", name: "Anubha", yrs: "2", designation: "Sex Specialist", address: "Domlur, One time Clinic", fees: "~ Rs 450 - Consultation fees"),
                                     Doctors(image: "dummy-doctor1", name: "Maithri", yrs: "1", designation: "Sex Specialist", address: "Domlur, One time Clinic", fees: "~ Rs 650 - Consultation fees"),
                                     Doctors(image: "dummy-doctor1", name: "Hiranmayi", yrs: "5", designation: "Sex Specialist", address: "Domlur, One time Clinic", fees: "~ Rs 700 - Consultation fees"),
                                     Doctors(image: "dummy-doctor1", name: "Chinmai", yrs: "4", designation: "Sex Specialist", address: "Domlur, One time Clinic", fees: "~ Rs 800 - Consultation fees"),
                                     Doctors(image: "dummy-doctor1", name: "Ramya", yrs: "9", designation: "Sex Specialist", address: "Domlur, One time Clinic", fees: "~ Rs 750 - Consultation fees")
                                     
    ]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doctorTableView.rowHeight = 280
        
        doctorTableView.backgroundColor =  UIColor.colorFromHex("#F5F5F5")
        
        doctorTableView.estimatedRowHeight = UITableView.automaticDimension
        
        let nibCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        doctorTableView.register(nibCell, forCellReuseIdentifier: "doctorCell")
        
        doctorTableView.dataSource = self
        
        doctorTableView.backgroundColor =  UIColor.colorFromHex("#F5F5F5")

    }

    // MARK: - Datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func viewWillAppear(_ animated: Bool) {
//        if #available(iOS 11.0, *) {
//             self.additionalSafeAreaInsets.top = 20
//        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorCell", for: indexPath) as! CustomTableViewCell
        
        cell.delegate = self
        
        cell.cellIndex = indexPath.row

        switch docType {
            
        case "Dental Care":
            let dentist = self.dentists[indexPath.row]
            cell.doctName.text = dentist.name
            cell.doctImage.image = UIImage(named: dentist.image)
            cell.experience.text = dentist.yrs + " years experience overall"
            cell.fees.text = dentist.fees
            cell.designation.text = dentist.designation
            cell.clinicAddress.text = dentist.address
            cell.cellIndex = indexPath.row
            
            if dentist.appmtBooked == true{
                //   cell.bookAppointmentt.titleLabel?.textColor = .white
   //                cell.bookAppointmentt.backgroundColor = UIColor.colorFromHex("#89CFF0")
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                dentist.notifCall(titleSent: "Your appointment with \(dentist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case "Skin & Hair":
            let dermatologist = self.dermatalogists[indexPath.row]
            cell.doctName.text = dermatologist.name
            
            cell.doctImage.image = UIImage(named: dermatologist.image)
            cell.experience.text = dermatologist.yrs + " years experience overall"
            cell.fees.text = dermatologist.fees
            cell.designation.text = dermatologist.designation
            cell.clinicAddress.text = dermatologist.address
            cell.cellIndex = indexPath.row
            if dermatologist.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                dermatologist.notifCall(titleSent: "Hey there! Your appointment with \(dermatologist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
                
            }

        case "Digestive Issues":
            let digestive = self.digestives[indexPath.row]
            cell.doctName.text = digestive.name
            cell.doctImage.image = UIImage(named: digestive.image)
            cell.experience.text = digestive.yrs + " years experience overall"
            cell.fees.text = digestive.fees
            cell.designation.text = digestive.designation
            cell.clinicAddress.text = digestive.address
            cell.cellIndex = indexPath.row
            if digestive.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                digestive.notifCall(titleSent: "Hey there! Your appointment with \(digestive.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
                
            }

        case "Ear Nose Throat":
            
            let ent = self.ents[indexPath.row]
            cell.doctName.text = ent.name
            cell.doctImage.image = UIImage(named: ent.image)
            cell.experience.text = ent.yrs + " years experience overall"
            cell.fees.text = ent.fees
            cell.designation.text = ent.designation
            cell.clinicAddress.text = ent.address
            cell.cellIndex = indexPath.row
            if ent.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                ent.notifCall(titleSent: "Hey there! Your appointment with \(ent.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }

            
        case "Eye Specialist":
            
            let eye = self.eyespecialists[indexPath.row]
            cell.doctName.text = eye.name
            cell.doctImage.image = UIImage(named: eye.image)
            cell.experience.text = eye.yrs + " years experience overall"
            cell.fees.text = eye.fees
            cell.designation.text = eye.designation
            cell.clinicAddress.text = eye.address
            cell.cellIndex = indexPath.row

            if eye.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                eye.notifCall(titleSent: "Hey there! Your appointment with \(eye.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
            
        case "Child Specialist":
            
            let childSpecialist = self.childspecialists[indexPath.row]
            cell.doctName.text = childSpecialist.name
            cell.doctImage.image = UIImage(named: childSpecialist.image)
            cell.experience.text = childSpecialist.yrs + " years experience overall"
            cell.fees.text = childSpecialist.fees
            cell.designation.text = childSpecialist.designation
            cell.clinicAddress.text = childSpecialist.address
            cell.cellIndex = indexPath.row
            if childSpecialist.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                childSpecialist.notifCall(titleSent: "Hey there! Your appointment with \(childSpecialist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case "Women's Health":
            
            let gynaecologist = self.gynaecologists[indexPath.row]
            cell.doctName.text = gynaecologist.name
            cell.doctImage.image = UIImage(named: gynaecologist.image)
            cell.experience.text = gynaecologist.yrs + " years experience overall"
            cell.fees.text = gynaecologist.fees
            cell.designation.text = gynaecologist.designation
            cell.clinicAddress.text = gynaecologist.address
            cell.cellIndex = indexPath.row
            if gynaecologist.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                gynaecologist.notifCall(titleSent: "Hey there! Your appointment with \(gynaecologist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }

        case "Homeopathy":
            
            let homeopathist = self.homeopathists[indexPath.row]
            cell.doctName.text = homeopathist.name
            cell.doctImage.image = UIImage(named: homeopathist.image)
            cell.experience.text = homeopathist.yrs + " years experience overall"
            cell.fees.text = homeopathist.fees
            cell.designation.text = homeopathist.designation
            cell.clinicAddress.text = homeopathist.address
            cell.cellIndex = indexPath.row
            if homeopathist.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                homeopathist.notifCall(titleSent: "Hey there! Your appointment with \(homeopathist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
            
        case "Bone & Joints":
            
            let orthopaedecian = self.orthopaedicians[indexPath.row]
            cell.doctName.text = orthopaedecian.name
            cell.doctImage.image = UIImage(named: orthopaedecian.image)
            cell.experience.text = orthopaedecian.yrs + " years experience overall"
            cell.fees.text = orthopaedecian.fees
            cell.designation.text = orthopaedecian.designation
            cell.clinicAddress.text = orthopaedecian.address
            cell.cellIndex = indexPath.row
            if orthopaedecian.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                orthopaedecian.notifCall(titleSent: "Hey there! Your appointment with \(orthopaedecian.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }

        case "Mental Wellness":
            
            let pshychiatrist = self.psychiatrists[indexPath.row]
            cell.doctName.text = pshychiatrist.name
            cell.doctImage.image = UIImage(named: pshychiatrist.image)
            cell.experience.text = pshychiatrist.yrs + " years experience overall"
            cell.fees.text = pshychiatrist.fees
            cell.designation.text = pshychiatrist.designation
            cell.clinicAddress.text = pshychiatrist.address
            cell.cellIndex = indexPath.row
            if pshychiatrist.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                pshychiatrist.notifCall(titleSent: "Hey there! Your appointment with \(pshychiatrist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case "Sex Specialist":
            
            let sexSpecialist = self.sexspecialists[indexPath.row]
            cell.doctName.text = sexSpecialist.name
            cell.doctImage.image = UIImage(named: sexSpecialist.image)
            cell.experience.text = sexSpecialist.yrs + " years experience overall"
            cell.fees.text = sexSpecialist.fees
            cell.designation.text = sexSpecialist.designation
            cell.clinicAddress.text = sexSpecialist.address
            cell.cellIndex = indexPath.row
            if sexSpecialist.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                sexSpecialist.notifCall(titleSent: "Hey there! Your appointment with \(sexSpecialist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case "General Physician":
            
            let physician = self.physicians[indexPath.row]
            cell.doctName.text = physician.name
            cell.doctImage.image = UIImage(named: physician.image)
            cell.experience.text = physician.yrs + " years experience overall"
            cell.fees.text = physician.fees
            cell.designation.text = physician.designation
            cell.clinicAddress.text = physician.address
            cell.cellIndex = indexPath.row
          
            if physician.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
               // cell.bookAppointmentt.textColor = .white
                physician.notifCall(titleSent: "Hey there! Your appointment with \(physician.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
 
        default:
            print("none")
        }
        
        return cell
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    
}
    
