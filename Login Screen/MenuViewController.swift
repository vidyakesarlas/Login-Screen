//
//  MenuViewController.swift
//  Login Screen
//
//  Created by vidya.k on 21/04/22.
//

import UIKit
import CoreLocation

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    var city: String?
    
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    var y: String?
    let menuID = "MenuCollectionViewCell"
    
    var menuVC:MenuViewController?
    
    var concerns: [Concerns] = [Concerns(image: "dentalcare", name: "Dental Care"),
                                Concerns(image: "dermatologist", name: "Skin & Hair"),
                                Concerns(image: "digestive", name: "Digestive Issues"),
                                Concerns(image: "ent", name: "Ear Nose Throat"),
                                Concerns(image: "eye", name: "Eye Specialist"),
                                Concerns(image: "fetus", name: "Child Specialist"),
                                Concerns(image: "gynaecology", name: "Women's Health"),
                                Concerns(image: "homeopathy", name: "Homeopathy"),
                                Concerns(image: "humanbone", name: "Bone & Joints"),
                                Concerns(image: "mentalhealth", name: "Mental Wellness"),
                                Concerns(image: "sex", name: "Sex Specialist"),
                                Concerns(image: "stethoscope", name: "General Physician"),
    ]
    
    
    @IBOutlet weak var cityName: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
    
    let locationMan = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationMan.delegate = self
        locationMan.requestWhenInUseAuthorization()
        locationMan.requestLocation()
        
        self.navigationController?.isNavigationBarHidden = false
        
        
        let nibCell = UINib(nibName: menuID, bundle: nil)
        
        menuCollectionView.register(nibCell, forCellWithReuseIdentifier: menuID)
        
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical //.horizontal
        layout.minimumLineSpacing = 11
        layout.minimumInteritemSpacing = 2
        
        menuCollectionView.layer.cornerRadius = 1.0
        menuCollectionView.layer.masksToBounds = true
        //   contentView.layer.cornerRadius = 5.0
        
        menuCollectionView.setCollectionViewLayout(layout, animated: true)
        
        
        menuCollectionView.reloadData()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func locationName(_ sender: Any) {
        
        self.locationMan.requestLocation()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)//here your custom value for spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        
        return CGSize(width:widthPerItem, height:100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return concerns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuID, for: indexPath) as! MenuCollectionViewCell
        
        
        cell.layer.cornerRadius = 25
        let concern = concerns[indexPath.row]
        
        
        cell.imageView.image = UIImage(named: concern.image)
        
        cell.imageView.layer.cornerRadius = 30
        cell.imageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        cell.labelName.text = concern.name
        
        
        
        cell.backgroundColor = UIColor.clear
        
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuID, for: indexPath) as! MenuCollectionViewCell
        let concern = concerns[indexPath.row]
        
        // destVC.navigationItem.title = concern.name
        y = concern.name
        self.performSegue(withIdentifier: "didSelect", sender: self)
        
        
    }
    
    func getCoordinates(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> (CLLocationDegrees, CLLocationDegrees){
        
        return (latitude, longitude)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Create a variable to store the name the user entered on textField
        
        
        // Create a new variable to store the instance of the SecondViewController
        // set the variable from the SecondViewController that will receive the data
        let destinationVC = segue.destination as! DoctorsViewController
        destinationVC.docType = y
        destinationVC.navigationItem.title = y
    }
    
 
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    func newOne(lati:  CLLocationDegrees, longi: CLLocationDegrees){
        //(latitude: -22.963451, longitude: -43.198242) - rio de janeiro
        
        //(latitude:  12.971599, longitude:  77.594566) - bengaluru
        let location = CLLocation(latitude: lati, longitude: longi)
        location.geocode(latitude: lati, longitude: longi, completion: { placemark, error in
            if let error = error as? CLError {
                print("CLError:", error)
                return
            }
            else if let placemark = placemark?.first {
                // you should always update your UI in the main thread
                DispatchQueue.main.async {

                    print("city:", placemark.locality ?? "unknown")
                    
                    self.cityName.title = "\(placemark.locality!)"
                    self.cityName.isEnabled = false
                    
                }
            }
        })
    }
}





extension CLLocation{
    
    
    
    func geocode(latitude: Double, longitude: Double, completion: @escaping (_ placemark: [CLPlacemark]?, _ error: Error?) -> Void)  {
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { placemark, error in
            guard let placemark = placemark, error == nil else {
                completion(nil, error)
                return
            }
            completion(placemark, nil)
        }
    }
    
    
}


extension MenuViewController: CLLocationManagerDelegate{
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last{
            
            locationMan.stopUpdatingLocation()
            let  lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            print("Latitude:::: +\(lat)")
            print("Longitude:::: +\(long)")
            
            newOne(lati: lat, longi: long)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}



