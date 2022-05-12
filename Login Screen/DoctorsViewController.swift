//
//  DoctorsViewController.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import UIKit

class DoctorsViewController: UIViewController, UITableViewDataSource, UIPopoverPresentationControllerDelegate, MyTableViewCellDelegate {
    func didTapButton(with title: String) {
        print("\(title)")
        let date = UIDatePicker()
      //  self.performSegue(withIdentifier: "popUpVC" , sender: self)
        var popUpWindow: PopUpWindow!
        popUpWindow = PopUpWindow(title: "Select date", text: "Choose a date convenient for you", buttontext: "OK", datePicker: date, button: "Cancel")
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


    ]

    var ents: [Doctors] = [Doctors(image: "John", name: "John", yrs: "10", designation: "Ear Nose Throat", address: "Adugodi 5 block, BGS Clinic", fees: "~ Rs 600 - Consultation fees"),

                              Doctors(image: "Nagarjuna", name: "Nagarjuna", yrs: "2", designation: "Ear Nose Throat", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 600 - Consultation fees"),
                              Doctors(image: "Vikram", name: "Vikram", yrs: "5", designation: "Ear Nose Throat", address: "Adugodi 5 block, BGS Clinic", fees: "~ Rs 700 - Consultation fees"),
                              Doctors(image: "Abheetha", name: "Abheetha", yrs: "3", designation: "Ear Nose Throat", address: "Jayanagar 5 block, Shreya Clinic", fees: "~ Rs 650 - Consultation fees"),

                                                        Doctors(image: "Raghav", name: "Raghav", yrs: "4", designation: "Ear Nose Throat", address: "Koramangala 5 block, Sahana Clinic", fees: "~ Rs 400 - Consultation fees"),
                                                        Doctors(image: "Spoorthy", name: "Spoorthy", yrs: "9", designation: "Ear Nose Throat", address: "Adugodi 5 block, BGS Clinic", fees: "~ Rs 350 - Consultation fees")

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
                                                        Doctors(image: "Akhtar", name: "Akhtar", yrs: "9", designation: "Child Specialist", address: "Kengeri Satellite Town, Chandramouli Clinic", fees: "~ Rs 800 - Consultation fees")

    ]


    var gynaecologists: [Doctors] = [Doctors(image: "Ron", name: "Ron", yrs: "10", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 800 - Consultation fees"),
                              Doctors(image: "Harish", name: "Harish", yrs: "10", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 750 - Consultation fees"),
                              Doctors(image: "Sushma", name: "Sushma", yrs: "2", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 600 - Consultation fees"),
                              Doctors(image: "Hermoine", name: "Hermoine", yrs: "5", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 500 - Consultation fees"),
                              Doctors(image: "Harry", name: "Harry", yrs: "3", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 450 - Consultation fees"),
                              Doctors(image: "Enid", name: "Enid", yrs: "2", designation: "Gynaecologist", address: "Vijayanagar, Maya Clinic", fees: "~ Rs 300 - Consultation fees"),


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

    
    
    
    
    
    var docType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        doctorTableView.rowHeight = 350
        
        
        doctorTableView.estimatedRowHeight = UITableView.automaticDimension
        
        let nibCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        doctorTableView.register(nibCell, forCellReuseIdentifier: "doctorCell")
        
        doctorTableView.dataSource = self
        
//        doctorTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "doctorCell")
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
 
    // MARK: - Datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dentists.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell = tableView.dequeueReusableCell(withIdentifier: "doctorCell", for: indexPath) as! CustomTableViewCell
        
        
        cell.delegate = self
        
        //cell.configure(with: data[indexPath.row])
       
//
//        // Configure the cell’s contents with the row and section number.
//        // The Basic cell style guarantees a label view is present in textLabel.
////        cell.doctName?.text = "Maithri"
////        cell.doctImage?.image = UIImage(named: "dummy-doctor1")
////        cell.experience?.text = "4"
//        let doctor = dentists[indexPath.row]
//
//
//        cell.doctImage.image = UIImage(named: doctor.image)
//
////        cell.imageView.layer.cornerRadius = 30
////        cell.imageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
//        cell.doctName.text = doctor.name
//        cell.experience.text = doctor.yrs
//        cell.backgroundColor = UIColor.clear
        
        
//
//        [Concerns(image: "dentalcare", name: "Dental Care"),
//                                    Concerns(image: "dermatologist", name: "Skin & Hair"),
//                                    Concerns(image: "digestive", name: "Digestive Issues"),
//                                    Concerns(image: "ent", name: "Ear Nose Throat"),
//                                    Concerns(image: "eye", name: "Eye Specialist"),
//                                    Concerns(image: "fetus", name: "Child Specialist"),
//                                    Concerns(image: "gynaecology", name: "Women's Health"),
//                                    Concerns(image: "homeopathy", name: "Homeopathy"),
//                                    Concerns(image: "humanbone", name: "Bone & Joints"),
//                                    Concerns(image: "mentalhealth", name: "Mental Wellness"),
//                                    Concerns(image: "sex", name: "Sex Specialist"),
//                                    Concerns(image: "stethoscope", name: "General Physician"),]
        
        switch docType {
            
        case "Dental Care":
            let dentist = self.dentists[indexPath.row]
            cell.doctName.text = dentist.name
            cell.doctImage.image = UIImage(named: dentist.image)
            cell.experience.text = dentist.yrs + " years experience overall"
            cell.fees.text = dentist.fees
            cell.designation.text = dentist.designation
            cell.clinicAddress.text = dentist.address
//            cell.bookAppointmentt.tag = indexPath.row
//            cell.bookAppointmentt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)
//
        case "Skin & Hair":
            let dermatologist = self.dermatalogists[indexPath.row]
            cell.doctName.text = dermatologist.name
         
            cell.doctImage.image = UIImage(named: dermatologist.image)
            cell.experience.text = dermatologist.yrs + " years experience overall"
            cell.fees.text = dermatologist.fees
            cell.designation.text = dermatologist.designation
            cell.clinicAddress.text = dermatologist.address
//            cell.bookAppointmentt.tag = indexPath.row
//            cell.bookAppointmentt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)
//
        case "Digestive Issues":
            let digestive = self.digestives[indexPath.row]
            cell.doctName.text = digestive.name
            cell.doctImage.image = UIImage(named: digestive.image)
            cell.experience.text = digestive.yrs + " years experience overall"
            cell.fees.text = digestive.fees
            cell.designation.text = digestive.designation
            cell.clinicAddress.text = digestive.address
//            cell.bookAppointmentt.tag = indexPath.row
//            cell.bookAppointmentt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)
//
        case "Ear Nose Throat":
            
            let ent = self.ents[indexPath.row]
            cell.doctName.text = ent.name
            cell.doctImage.image = UIImage(named: ent.image)
            cell.experience.text = ent.yrs + " years experience overall"
            cell.fees.text = ent.fees
            cell.designation.text = ent.designation
            cell.clinicAddress.text = ent.address
//            cell.bookAppointmentt.tag = indexPath.row
//            cell.bookAppointmentt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)

            
            
        case "Eye Specialist":
            
            let eye = self.eyespecialists[indexPath.row]
            cell.doctName.text = eye.name
            cell.doctImage.image = UIImage(named: eye.image)
            cell.experience.text = eye.yrs + " years experience overall"
            cell.fees.text = eye.fees
            cell.designation.text = eye.designation
            cell.clinicAddress.text = eye.address
            cell.bookAppointmentt.tag = indexPath.row
            cell.bookAppointmentt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)
            
        case "Child Specialist":
            
            let childSpecialist = self.childspecialists[indexPath.row]
            cell.doctName.text = childSpecialist.name
            cell.doctImage.image = UIImage(named: childSpecialist.image)
            cell.experience.text = childSpecialist.yrs + " years experience overall"
            cell.fees.text = childSpecialist.fees
            cell.designation.text = childSpecialist.designation
            cell.clinicAddress.text = childSpecialist.address
//            cell.bookAppointmentt.tag = indexPath.row
//            cell.bookAppointmentt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)

            
        case "Women's Health":
            
            let gynaecologist = self.gynaecologists[indexPath.row]
            cell.doctName.text = gynaecologist.name
            cell.doctImage.image = UIImage(named: gynaecologist.image)
            cell.experience.text = gynaecologist.yrs + " years experience overall"
            cell.fees.text = gynaecologist.fees
            cell.designation.text = gynaecologist.designation
            cell.clinicAddress.text = gynaecologist.address
//            cell.bookAppointmentt.tag = indexPath.row
//            cell.bookAppointmentt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)
//
        case "Homeopathy":
            
            let homeopathist = self.homeopathists[indexPath.row]
            cell.doctName.text = homeopathist.name
            cell.doctImage.image = UIImage(named: homeopathist.image)
            cell.experience.text = homeopathist.yrs + " years experience overall"
            cell.fees.text = homeopathist.fees
            cell.designation.text = homeopathist.designation
            cell.clinicAddress.text = homeopathist.address
           
            
        case "Bone & Joints":
            
            let orthopaedecian = self.orthopaedicians[indexPath.row]
            cell.doctName.text = orthopaedecian.name
            cell.doctImage.image = UIImage(named: orthopaedecian.image)
            cell.experience.text = orthopaedecian.yrs + " years experience overall"
            cell.fees.text = orthopaedecian.fees
            cell.designation.text = orthopaedecian.designation
            cell.clinicAddress.text = orthopaedecian.address
//            cell.bookAppointmentt.tag = indexPath.row
//            cell.bookAppointmentt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)


        case "Mental Wellness":
            
            let pshychiatrist = self.psychiatrists[indexPath.row]
            cell.doctName.text = pshychiatrist.name
            cell.doctImage.image = UIImage(named: pshychiatrist.image)
            cell.experience.text = pshychiatrist.yrs + " years experience overall"
            cell.fees.text = pshychiatrist.fees
            cell.designation.text = pshychiatrist.designation
            cell.clinicAddress.text = pshychiatrist.address
//            cell.bookAppointmentt.tag = indexPath.row
//            cell.bookAppointmentt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)

            
        case "Sex Specialist":
            
            let sexSpecialist = self.sexspecialists[indexPath.row]
            cell.doctName.text = sexSpecialist.name
            cell.doctImage.image = UIImage(named: sexSpecialist.image)
            cell.experience.text = sexSpecialist.yrs + " years experience overall"
            cell.fees.text = sexSpecialist.fees
            cell.designation.text = sexSpecialist.designation
            cell.clinicAddress.text = sexSpecialist.address
//            cell.bookAppointmentt.tag = indexPath.row
//            cell.bookAppointmentt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)

            
        case "General Physician":
            
            let physician = self.physicians[indexPath.row]
            cell.doctName.text = physician.name
            cell.doctImage.image = UIImage(named: physician.image)
            cell.experience.text = physician.yrs + " years experience overall"
            cell.fees.text = physician.fees
            cell.designation.text = physician.designation
            cell.clinicAddress.text = physician.address
//            cell.bookAppointmentt.tag = indexPath.row
//            cell.bookAppointmentt.addTarget(self, action: #selector(self.rowButtonWasTapped(sender:)), for: .touchUpInside)

    
        default:
            print("none")
        }
        
        
        
      
        //        cell.imageView.image = UIImage(named: "<#T##String#>")

       return cell
    }
    
    @objc func rowButtonWasTapped(sender:UIButton){
    let rowIndex:Int = sender.tag
    print(rowIndex)
        
//        let popOverVC = UIStoryboard(name: "Storyboard1", bundle: nil).instantiateViewController(withIdentifier: "PopUp") as! PopupViewController
//
//            self.addChild(popOverVC)
//
//            popOverVC.view.frame = self.view.frame
//            self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParent: self)
//
//
//
        
       // self.performSegue(withIdentifier: "popUpVC" , sender: self)
        
    // Do somethign with the data at rowIndex
    }
    
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
            if segue.identifier == "popUpVC" {
                let aboutController = segue.destination as! PopupViewController
                aboutController.preferredContentSize = CGSize(width:300, height:440)
               
                let popoverController = aboutController.popoverPresentationController
               
                if popoverController != nil {
                    popoverController!.delegate = self
                    popoverController!.backgroundColor = UIColor.black
                }
            }
        }
       
        func adaptivePresentationStyle(controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
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


//extension DoctorsViewController: MyTableViewCellDelegate{
//
//    func didTapButton(with title: String){
//        print("\(title)")
//    }
//
//
//}
//
//



