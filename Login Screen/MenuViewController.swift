//
//  MenuViewController.swift
//  Login Screen
//
//  Created by vidya.k on 21/04/22.
//

import UIKit
import CoreLocation

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    var lat: CLLocationDegrees?
    var long: CLLocationDegrees?
    
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
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        navigationItem.title = nil
    //        if segue.identifier == "pizza"{
    //            let vc = segue.destinationViewController as UIViewController
    //            vc.navigationItem.title = "View Controller Pizza"
    //            navigationItem.title = "Pizza to One"
    //        }
    //        if segue.identifier == "pasta"{
    //            let vc = segue.destinationViewController as UIViewController
    //            vc.navigationItem.title = "View Controller Linguine all’arrabbiata"
    //            navigationItem.title = "Pasta to One"
    //        }
    //    }
    //
    
    @IBAction func locationName(_ sender: Any) {
        
        //(latitude: -22.963451, longitude: -43.198242) - rio de janeiro
        
        //(latitude:  12.971599, longitude:  77.594566) - bengaluru
        let location = CLLocation(latitude: lat ?? 0.000000000, longitude: long ?? 0.0000000)
        location.geocode(latitude: lat ?? 0.000000000, longitude: long ?? 0.000000000, completion: { placemark, error in
            if let error = error as? CLError {
                print("CLError:", error)
                return
            }
            else if let placemark = placemark?.first {
                // you should always update your UI in the main thread
                DispatchQueue.main.async {
                    //  update UI here
                    //                    print("name:", placemark.name ?? "unknown")
                    //
                    //                    print("address1:", placemark.thoroughfare ?? "unknown")
                    //                    print("address2:", placemark.subThoroughfare ?? "unknown")
                    //                    print("neighborhood:", placemark.subLocality ?? "unknown")
                    print("city:", placemark.locality ?? "unknown")
                    
                    self.cityName.title = "location: \(placemark.locality!)"
                    
                    //                    print("state:", placemark.administrativeArea ?? "unknown")
                    //                    print("subAdministrativeArea:", placemark.subAdministrativeArea ?? "unknown")
                    //                    print("zip code:", placemark.postalCode ?? "unknown")
                    //                    print("country:", placemark.country ?? "unknown", terminator: "\n\n")
                    //
                    //                    print("isoCountryCode:", placemark.isoCountryCode ?? "unknown")
                    //                    print("region identifier:", placemark.region?.identifier ?? "unknown")
                    //
                    //                    print("timezone:", placemark.timeZone ?? "unknown", terminator:"\n\n")
                    
                    // Mailind Address
                    //  print(placemark.mailingAddress ?? "unknown")
                }
            }
        })
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Create a variable to store the name the user entered on textField
        
        
        // Create a new variable to store the instance of the SecondViewController
        // set the variable from the SecondViewController that will receive the data
        let destinationVC = segue.destination as! DoctorsViewController
        destinationVC.docType = y
        destinationVC.navigationItem.title = y
    }
    
    
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //
    //        let inset: CGFloat = 10
    //
    //       return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    //
    //
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    //    }
    
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //         let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
    //         let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
    //         let size:CGFloat = (menuCollectionView.frame.size.width - space) / 2.0
    //         return CGSize(width: size, height: size)
    //     }
    //
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
            lat = location.coordinate.latitude
            long = location.coordinate.longitude
            print(lat)
            print(long)
            //    weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}



