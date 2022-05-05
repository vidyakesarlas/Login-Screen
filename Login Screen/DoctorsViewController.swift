//
//  DoctorsViewController.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import UIKit

class DoctorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var doctorTableView: UITableView!
    
    var docType: String?
    
   
    
    
    var dentists: [Doctors] = [Doctors(image: "Harshitha", name: "Harshitha", yrs: "10"),
                              Doctors(image: "Jaya", name: "Jaya", yrs: "10"),
                              Doctors(image: "Yashaswini", name: "Yashaswini", yrs: "2"),
                              Doctors(image: "Vidya", name: "Vidya", yrs: "5"),
                              Doctors(image: "Kshema", name: "Kshema", yrs: "3"),
                              Doctors(image: "Sunidhi", name: "Sunidhi", yrs: "2"),
                                                        Doctors(image: "Sushma", name: "Sushma", yrs: "1"),
                                                        Doctors(image: "Lakshmi", name: "Lakshmi", yrs: "5"),
                                                        Doctors(image: "Anne", name: "Anne", yrs: "4"),
                                                        Doctors(image: "Harsha", name: "Harsha", yrs: "9")
                               
    ]
    
    
    var dermatalogists: [Doctors] = [Doctors(image: "Mohini", name: "Mohini", yrs: "10"),
                              Doctors(image: "Sushma", name: "Sushma", yrs: "10"),
                              Doctors(image: "Lakshmi", name: "Lakshmi", yrs: "2"),
                              Doctors(image: "Bhavya", name: "Bhavya", yrs: "5"),
                              Doctors(image: "Vandita", name: "Vandita", yrs: "3"),
                              Doctors(image: "Nirmala", name: "Nirmala", yrs: "2"),
                                                        Doctors(image: "Trupthi", name: "Trupthi", yrs: "1"),
                                                        Doctors(image: "Disha", name: "Disha", yrs: "5"),
                                                        Doctors(image: "Srushty", name: "Srushty", yrs: "4"),
                                                        Doctors(image: "Kala", name: "Kala", yrs: "9")
                               
    ]
    
    var digestives: [Doctors] = [Doctors(image: "Varshitha", name: "Varshitha", yrs: "10"),
                              Doctors(image: "Ramya", name: "Ramya", yrs: "10"),
                              Doctors(image: "Mohan", name: "Mohan", yrs: "2"),
                              Doctors(image: "Sundaran", name: "Sundaran", yrs: "5"),
                              Doctors(image: "Vivek", name: "Vivek", yrs: "3"),
                              Doctors(image: "Vidya", name: "Vidya", yrs: "2"),
                                                        Doctors(image: "Srikanth", name: "Srikanth", yrs: "1"),
                                                        Doctors(image: "Srinivas", name: "Srinivas", yrs: "5"),
                                                      
                               
    ]
    
    var ents: [Doctors] = [Doctors(image: "John", name: "John", yrs: "10"),
                           
                              Doctors(image: "Nagarjuna", name: "Nagarjuna", yrs: "2"),
                              Doctors(image: "Vikram", name: "Vikram", yrs: "5"),
                              Doctors(image: "Abheetha", name: "Abheetha", yrs: "3"),
 
                                                        Doctors(image: "Raghav", name: "Raghav", yrs: "4"),
                                                        Doctors(image: "Spoorthy", name: "Spoorthy", yrs: "9")
                               
    ]
    
    var eyespecialists: [Doctors] = [Doctors(image: "Prajwal", name: "Prajwal", yrs: "10"),
                              Doctors(image: "Vineeth", name: "Vineeth", yrs: "10"),
                              Doctors(image: "Shwetha", name: "Shwetha", yrs: "2"),
                              Doctors(image: "Sathish", name: "Sathish", yrs: "5"),
                              Doctors(image: "Rose", name: "Rose", yrs: "3"),
                              Doctors(image: "Sunidhi", name: "Sunidhi", yrs: "2"),
                                                        Doctors(image: "Arundati", name: "Arundati", yrs: "1"),
                                                        Doctors(image: "Reena", name: "Reena", yrs: "5"),
                                                        Doctors(image: "Shanti", name: "Shanti", yrs: "4"),
                                                        Doctors(image: "dummy-doctor1", name: "Bairya", yrs: "9")
                               
    ]
    
    var childspecialists: [Doctors] = [
                              Doctors(image: "Pranitha", name: "Pranitha", yrs: "10"),
                              Doctors(image: "Prajwal", name: "Prajwal", yrs: "2"),
                              Doctors(image: "Olivia", name: "Olivia", yrs: "5"),
                              Doctors(image: "Mary", name: "Mary", yrs: "3"),
                              Doctors(image: "Madhusudhan", name: "Madhusudhan", yrs: "2"),
                                                        Doctors(image: "Divya", name: "Divya", yrs: "1"),
                                                        Doctors(image: "Lakshmi", name: "Lakshmi", yrs: "5"),
                                                        Doctors(image: "Deepa", name: "Deepa", yrs: "4"),
                                                        Doctors(image: "Akhtar", name: "Akhtar", yrs: "9")
                               
    ]
    
    
    var gynaecologists: [Doctors] = [Doctors(image: "Ron", name: "Ron", yrs: "10"),
                              Doctors(image: "Harish", name: "Harish", yrs: "10"),
                              Doctors(image: "Sushma", name: "Sushma", yrs: "2"),
                              Doctors(image: "Hermoine", name: "Hermoine", yrs: "5"),
                              Doctors(image: "Harry", name: "Harry", yrs: "3"),
                              Doctors(image: "Enid", name: "Enid", yrs: "2"),
                                                       
                               
    ]
    
    var homeopathists: [Doctors] = [Doctors(image: "Vikrant", name: "Vikrant", yrs: "10"),
                              Doctors(image: "Riya", name: "Riya", yrs: "10"),
                              Doctors(image: "Sahana", name: "Sahana", yrs: "2"),
                              Doctors(image: "Rakshitha", name: "Rakshitha", yrs: "5"),
                              Doctors(image: "Spoorthy", name: "Spoorthy", yrs: "3"),
                              Doctors(image: "Sarvadarshi", name: "Sarvadarshi", yrs: "2"),
                                                        Doctors(image: "Navya", name: "Navya", yrs: "1"),
                                                        Doctors(image: "Namratha", name: "Namratha", yrs: "5"),
                                                        Doctors(image: "Manish", name: "Manish", yrs: "4"),
                                                        Doctors(image: "Ujjwal", name: "Ujjwal", yrs: "9")
                               
    ]
    
    var orthopaedicians: [Doctors] = [Doctors(image: "Akshay", name: "Akshay", yrs: "10"),
                              Doctors(image: "Ashritha", name: "Ashritha", yrs: "10"),
                              Doctors(image: "Gokul", name: "Gokul", yrs: "2"),
                              Doctors(image: "dummy-doctor1", name: "Eshanye", yrs: "5"),
                              Doctors(image: "Tafseer", name: "Tafseer", yrs: "3"),
                              Doctors(image: "Sunil", name: "Sunil", yrs: "2"),
                                                        Doctors(image: "Rishabh", name: "Rishabh", yrs: "1"),
                                                        Doctors(image: "sourav", name: "sourav", yrs: "5"),
                                                        Doctors(image: "Bhavya", name: "Bhavya", yrs: "4"),
                                                        Doctors(image: "dummy-doctor1", name: "Pooja", yrs: "9")
                               
    ]
    
    var psychiatrists: [Doctors] = [Doctors(image: "Sanjay", name: "Sanjay", yrs: "10"),
                              Doctors(image: "dummy-doctor1", name: "sheeshir", yrs: "10"),
                              Doctors(image: "Jagadeesh", name: "Jagadeesh", yrs: "2"),
                              Doctors(image: "Girish", name: "Girish", yrs: "5"),
                              Doctors(image: "Rajalakshmi", name: "Rajalakshmi", yrs: "3"),
                              Doctors(image: "Ranjan", name: "Ranjan", yrs: "2"),
                                                        Doctors(image: "dummy-doctor1", name: "Rakshith", yrs: "1"),
                                                        Doctors(image: "dummy-doctor1", name: "Catherine", yrs: "5"),
                                                        Doctors(image: "dummy-doctor1", name: "Priyanka", yrs: "4"),
                                                        Doctors(image: "dummy-doctor1", name: "Parineeti", yrs: "9")
                               
    ]
    
    
    var physicians: [Doctors] = [Doctors(image: "dummy-doctor1", name: "Deepika", yrs: "10"),
                              Doctors(image: "dummy-doctor1", name: "Bheem", yrs: "10"),
                              Doctors(image: "Ameeth", name: "Ameeth", yrs: "2"),
                              Doctors(image: "Ashutosh", name: "Ashutosh", yrs: "5"),
                              Doctors(image: "Fernandez", name: "Fernandez", yrs: "3"),
                              Doctors(image: "Sohaib", name: "Sohaib", yrs: "2"),
                                                        Doctors(image: "Sukumar", name: "Sukumar", yrs: "1"),
                                                        Doctors(image: "dummy-doctor1", name: "Nidhi", yrs: "5"),
                                                        Doctors(image: "Chirantan", name: "Chirantan", yrs: "4"),
                                                        Doctors(image: "Tarun", name: "Tarun", yrs: "9")
                               
    ]
    
    var sexspecialists: [Doctors] = [Doctors(image: "dummy-doctor1", name: "Dimple", yrs: "10"),
                              Doctors(image: "dummy-doctor1", name: "Kumar", yrs: "10"),
                              Doctors(image: "dummy-doctor1", name: "Manu", yrs: "2"),
                              Doctors(image: "dummy-doctor1", name: "Jagannath", yrs: "5"),
                              Doctors(image: "dummy-doctor1", name: "Vishnu", yrs: "3"),
                              Doctors(image: "dummy-doctor1", name: "Anubha", yrs: "2"),
                                                        Doctors(image: "dummy-doctor1", name: "Maithri", yrs: "1"),
                                                        Doctors(image: "dummy-doctor1", name: "Hiranmayi", yrs: "5"),
                                                        Doctors(image: "dummy-doctor1", name: "Chinmai", yrs: "4"),
                                                        Doctors(image: "dummy-doctor1", name: "Ramya", yrs: "9")
                               
    ]
    
    
    
    
    
    
    
    
    
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        doctorTableView.rowHeight = 150
        doctorTableView.estimatedRowHeight = UITableView.automaticDimension
        
        let nibCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        doctorTableView.register(nibCell, forCellReuseIdentifier: "doctorCell")
        
        
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
            cell.experience.text = dentist.yrs
        
        case "Skin & Hair":
            let dermatologist = self.dermatalogists[indexPath.row]
            cell.doctName.text = dermatologist.name
            cell.doctImage.image = UIImage(named: dermatologist.image)
            cell.experience.text = dermatologist.yrs
            
        case "Digestive Issues":
            let digestive = self.digestives[indexPath.row]
            cell.doctName.text = digestive.name
            cell.doctImage.image = UIImage(named: digestive.image)
            cell.experience.text = digestive.yrs
            
        case "Ear Nose Throat":
            
            let ent = self.ents[indexPath.row]
            cell.doctName.text = ent.name
            cell.doctImage.image = UIImage(named: ent.image)
            cell.experience.text = ent.yrs
            
            
        case "Eye Specialist":
            
            let eye = self.eyespecialists[indexPath.row]
            cell.doctName.text = eye.name
            cell.doctImage.image = UIImage(named: eye.image)
            cell.experience.text = eye.yrs
            
        case "Child Specialist":
            
            let childSpecialist = self.childspecialists[indexPath.row]
            cell.doctName.text = childSpecialist.name
            cell.doctImage.image = UIImage(named: childSpecialist.image)
            cell.experience.text = childSpecialist.yrs
            
        case "Women's Health":
            
            let gynaecologist = self.gynaecologists[indexPath.row]
            cell.doctName.text = gynaecologist.name
            cell.doctImage.image = UIImage(named: gynaecologist.image)
            cell.experience.text = gynaecologist.yrs
            
        case "Homeopathy":
            
            let homeopathist = self.homeopathists[indexPath.row]
            cell.doctName.text = homeopathist.name
            cell.doctImage.image = UIImage(named: homeopathist.image)
            cell.experience.text = homeopathist.yrs
            
        case "Bone & Joints":
            
            let orthopaedecian = self.orthopaedicians[indexPath.row]
            cell.doctName.text = orthopaedecian.name
            cell.doctImage.image = UIImage(named: orthopaedecian.image)
            cell.experience.text = orthopaedecian.yrs

        case "Mental Wellness":
            
            let pshychiatrist = self.psychiatrists[indexPath.row]
            cell.doctName.text = pshychiatrist.name
            cell.doctImage.image = UIImage(named: pshychiatrist.image)
            cell.experience.text = pshychiatrist.yrs
            
        case "Sex Specialist":
            
            let sexSpecialist = self.sexspecialists[indexPath.row]
            cell.doctName.text = sexSpecialist.name
            cell.doctImage.image = UIImage(named: sexSpecialist.image)
            cell.experience.text = sexSpecialist.yrs
            
        case "General Physician":
            
            let physician = self.physicians[indexPath.row]
            cell.doctName.text = physician.name
            cell.doctImage.image = UIImage(named: physician.image)
            cell.experience.text = physician.yrs
    
        default:
            print("none")
        }
        
       return cell
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
