//
//  DoctorsViewController.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import UIKit

class DoctorsViewController: UIViewController, UITableViewDataSource, UIPopoverPresentationControllerDelegate, MyTableViewCellDelegate, PopUpWindowManager {
    
    var data: [Doctors] = []
    var docType: DoctorType = .none
    var okSelected: Bool = false
    var popUpWindow: PopUpWindow!
    static var datePicked:  String = ""
    static var timePciked: String = ""
    static var datePick: Date = Date()
    var dentist = DoctorManager()
    @IBOutlet weak var doctorTableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doctorTableView.rowHeight = 280
        doctorTableView.backgroundColor =  UIColor.colorFromHex("#F5F5F5")
        doctorTableView.estimatedRowHeight = UITableView.automaticDimension
        let nibCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        doctorTableView.register(nibCell, forCellReuseIdentifier: "doctorCell")
        doctorTableView.dataSource = self
        doctorTableView.backgroundColor =  UIColor.colorFromHex("#F5F5F5")
        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        self.navigationController?.navigationBar.isTranslucent = true
         appearance.backgroundColor = UIColor.systemBlue
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
//        appearance.backgroundColor = UIColor.systemBlue
//        self.navigationController?.navigationBar.backgroundColor = UIColor.systemBlue
        // pass "true" for fixing iOS 15.0 black bg issue
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        // We need to set tintcolor for iOS 15.0
//        appearance.shadowColor = .clear    //removing navigationbar 1 px bottom border.
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        //fetch doctors to display
        let plistsource: String = Bundle.main.path(forResource: self.docType.description, ofType: "plist")!
        data = dentist.getDoctorObject(path: plistsource)
    }
    
    
    func okButtonPressed(index: Int) {
        popUpWindow.dismissView()
        let alertContoller = UIAlertController (title: "Appointment booked!" , message: "You've booked an appointment for the date \(DoctorsViewController.datePicked) and time \(DoctorsViewController.timePciked) hours", preferredStyle: .alert)
        alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        self.present(alertContoller, animated: true, completion: nil)
        let doctor = data[index]
        doctor.appmtBooked = true
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
    
    // MARK: - Datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorCell", for: indexPath) as! CustomTableViewCell
        cell.delegate = self
        cell.cellIndex = indexPath.row
        
        switch docType {
        case .dental:
            let dentistt = data[indexPath.row]
            cell.doctName.text = dentistt.name
            cell.doctImage.image = UIImage(named: dentistt.image)
            cell.experience.text = dentistt.yrs + " years experience overall"
            cell.fees.text = dentistt.fees
            cell.designation.text = dentistt.designation
            cell.clinicAddress.text = dentistt.address
            cell.cellIndex = indexPath.row
            
            if dentistt.appmtBooked == true{
                cell.bookAppointmentt.setTitle("Appointment booked!", for: .normal)
                cell.bookAppointmentt.setTitleColor(.white, for: .normal)
                cell.bookAppointmentt.backgroundColor = UIColor.systemBlue
                cell.isUserInteractionEnabled = false
                dentistt.notifCall(titleSent: "Your appointment with \(dentistt.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .dermatology:
            let dermatologist = data[indexPath.row]
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
                dermatologist.notifCall(titleSent: "Your appointment with \(dermatologist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .digestive:
            let digestive = data[indexPath.row]
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
                digestive.notifCall(titleSent: "Your appointment with \(digestive.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .ent:
            let ent = data[indexPath.row]
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
                ent.notifCall(titleSent: "Your appointment with \(ent.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .eyeSpecialist:
            let eye = data[indexPath.row]
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
                eye.notifCall(titleSent: "Your appointment with \(eye.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .childSpecialist:
            let childSpecialist = data[indexPath.row]
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
                childSpecialist.notifCall(titleSent: "Your appointment with \(childSpecialist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .gynaecology:
            let gynaecologist = data[indexPath.row]
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
                gynaecologist.notifCall(titleSent: "Your appointment with \(gynaecologist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .homeopathy:
            
            let homeopathist = data[indexPath.row]
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
                homeopathist.notifCall(titleSent: "Your appointment with \(homeopathist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .orthopaedician:
            
            let orthopaedecian = data[indexPath.row]
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
                orthopaedecian.notifCall(titleSent: "Your appointment with \(orthopaedecian.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .psychiatry:
            let pshychiatrist = data[indexPath.row]
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
                pshychiatrist.notifCall(titleSent: "Your appointment with \(pshychiatrist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .sexSpecialist:
            let sexSpecialist = data[indexPath.row]
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
                sexSpecialist.notifCall(titleSent: "Your appointment with \(sexSpecialist.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
            }
            
        case .generalPhysician:
            let physician = data[indexPath.row]
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
                physician.notifCall(titleSent: "Your appointment with \(physician.name) is in few mins", bodySent: "Hope you're in the hospital", dateBooked: DoctorsViewController.datePick)
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

