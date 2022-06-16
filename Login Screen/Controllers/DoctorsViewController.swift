//
//  DoctorsViewController.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import UIKit

class DoctorsViewController: UIViewController, UITableViewDataSource, UIPopoverPresentationControllerDelegate, MyTableViewCellDelegate, PopUpWindowManager, UISearchBarDelegate, UISearchResultsUpdating{
    var searching = false
    var searchedItem = [Doctors]()
    let searchController = UISearchController(searchResultsController: nil)
    
    func configureSearchController(){
        let myNewView=UIView(frame: CGRect(x: 0, y: 3, width: self.searchController.searchBar.frame.size.width, height: 35))
        myNewView.backgroundColor=UIColor.lightGray
        self.view.addSubview(myNewView)
        myNewView.addSubview(searchController.searchBar)
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.hidesSearchBarWhenScrolling
        = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Searchby: name, experience, fees or place"
        searchController.searchBar.barTintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        searchController.searchBar.tintColor = UIColor.black
        searchController.searchBar.backgroundColor = UIColor.white
        searchController.searchBar.isTranslucent = true
        searchController.searchBar.searchTextField.textColor = UIColor.black
       // navigationItem.titleView?.layoutIfNeeded()
    }
    func updateSearchResults(for searchController: UISearchController){
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            searchedItem.removeAll()
            for item in data{
                if item.name.description.lowercased().contains(searchText.lowercased()) || item.yrs.description.lowercased().contains(searchText.lowercased()) || item.address.description.lowercased().contains(searchText.lowercased()) || item.fees.description.lowercased().contains(searchText.lowercased()) {
                    searchedItem.append(item)
                }
            }
        }
        else{
            searching = false
            searchedItem.removeAll()
            searchedItem = data
        }
        doctorTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedItem.removeAll()
        doctorTableView.reloadData()
    }
    var sortedData: [Doctors] = []
    var data: [Doctors] = []
    var newData: [Doctors] = []
    var docType: DoctorType = .none
    var okSelected: Bool = false
    var popUpWindow: PopUpWindow!
    static var datePicked:  String = ""
    static var timePciked: String = ""
    static var datePick: Date = Date()
    var doctorList = DoctorManager()
    @IBOutlet weak var doctorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        let currWidth = logoutButton.customView?.widthAnchor.constraint(equalToConstant: 14)
        currWidth?.isActive = true
        let currHeight = logoutButton.customView?.heightAnchor.constraint(equalToConstant: 14)
        currHeight?.isActive = true
        doctorTableView.rowHeight = 280
        doctorTableView.backgroundColor =  UIColor.colorFromHex("#F5F5F5")
        doctorTableView.estimatedRowHeight = UITableView.automaticDimension
        let nibCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        doctorTableView.register(nibCell, forCellReuseIdentifier: "doctorCell")
        doctorTableView.dataSource = self
        doctorTableView.backgroundColor =  UIColor.colorFromHex("#F5F5F5")
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.systemBlue
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let standardAppearance = UINavigationBarAppearance()
        // Title font color
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        // prevent Nav Bar color change on scroll view push behind NavBar
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        if UIApplication.isFirstLaunch(){
            copyFilesFromBundleToDocumentsFolderWith(fileExtension: ".plist")
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let documentsDirectory = urls[0]
            print(documentsDirectory)
            let docUrl = documentsDirectory.appendingPathComponent("\(self.docType.description).plist")
            //print(docUrl)
            //fetch doctors to display
            let plistsource: URL = docUrl
            data = doctorList.getDoctorObject(path: plistsource)
            print(data)
        }
        else{
        }
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = urls[0]
        print(documentsDirectory)
        let docUrl = documentsDirectory.appendingPathComponent("\(self.docType.description).plist")
        print(docUrl)
        //fetch doctors to display
        let plistsource: URL = docUrl
        data = doctorList.getDoctorObject(path: plistsource)
        sortedData = data.sorted { $0.name < $1.name }
        print(data)
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
        let newViewObject = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! ViewController
        navigationController?.pushViewController(newViewObject, animated: true)
        // self.navigationController?.popToRootViewController(animated: true)
    }
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    
    func copyFilesFromBundleToDocumentsFolderWith(fileExtension: String) {
        if let resPath = Bundle.main.resourcePath {
            do {
                let dirContents = try FileManager.default.contentsOfDirectory(atPath: resPath)
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                let filteredFiles = dirContents.filter{ $0.contains(fileExtension)}
                for fileName in filteredFiles {
                    if let documentsURL = documentsURL {
                        let sourceURL = Bundle.main.bundleURL.appendingPathComponent(fileName)
                        let destURL = documentsURL.appendingPathComponent(fileName)
                        do { try FileManager.default.copyItem(at: sourceURL, to: destURL) } catch { }
                    }
                }
            } catch { }
        }
    }
    
    func okButtonPressed(index: Int) {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var documentsDirectory = urls[0]
        let docUrl = documentsDirectory.appendingPathComponent("\(self.docType.description).plist")
        let plistsource: URL = docUrl
        popUpWindow.dismissView()
        let alertContoller = UIAlertController (title: "Appointment booked!" , message: "You've booked an appointment for the date \(DoctorsViewController.datePicked) and time \(DoctorsViewController.timePciked) hours", preferredStyle: .alert)
        alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        self.present(alertContoller, animated: true, completion: nil)
        data[index].appmtBooked = true
        print("name of doc:\(data[index].name)")
        if let docArray = NSMutableArray(contentsOf: plistsource ?? docUrl){
            let obj = docArray[index] as! NSMutableDictionary
            obj["appmtBooked"] = true
            print(obj)
            docArray.write(toFile: plistsource.path as String, atomically: true)
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
    
    // MARK: - Datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchedItem.count
        }
        else{
            return data.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorCell", for: indexPath) as! CustomTableViewCell
        cell.delegate = self
        if searching{
            cell.cellIndex = indexPath.row
            switch docType {
            case .dental:
                let dentistt = searchedItem[indexPath.row]
                print("data wanted-\(dentistt)")
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
                let dermatologist = searchedItem[indexPath.row]
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
                let digestive = searchedItem[indexPath.row]
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
                let ent = searchedItem[indexPath.row]
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
                let eye = searchedItem[indexPath.row]
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
                let childSpecialist = searchedItem[indexPath.row]
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
                let gynaecologist = searchedItem[indexPath.row]
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
                
                let homeopathist = searchedItem[indexPath.row]
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
                
                let orthopaedecian = searchedItem[indexPath.row]
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
                let pshychiatrist = searchedItem[indexPath.row]
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
                let sexSpecialist = searchedItem[indexPath.row]
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
                let physician = searchedItem[indexPath.row]
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
        }else{
            cell.cellIndex = indexPath.row
            
            switch docType {
            case .dental:
                let dentistt = sortedData[indexPath.row]
                print("data wanted-\(dentistt)")
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
                let dermatologist = sortedData[indexPath.row]
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
                let digestive = sortedData[indexPath.row]
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
                let ent = sortedData[indexPath.row]
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
                let eye = sortedData[indexPath.row]
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
                let childSpecialist = sortedData[indexPath.row]
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
                let gynaecologist = sortedData[indexPath.row]
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
                let homeopathist = sortedData[indexPath.row]
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
                let orthopaedecian = sortedData[indexPath.row]
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
                let pshychiatrist = sortedData[indexPath.row]
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
                let sexSpecialist = sortedData[indexPath.row]
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
                let physician = sortedData[indexPath.row]
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
            
        }
        
        return cell
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension UIApplication {
    class func isFirstLaunch() -> Bool {
        if !UserDefaults.standard.bool(forKey: "hasBeenLaunchedBeforeFlag") {
            UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBeforeFlag")
            UserDefaults.standard.synchronize()
            return true
        }
        return false
    }
}
