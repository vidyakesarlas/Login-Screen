//
//  HealthConcernViewController.swift
//  Login Screen
//
//  Created by vidya.k on 21/04/22.
//

import UIKit

class HealthConcernViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    private let reuseIdentifier = "concernCell"
 
    

    
    
  
     var concerns: [Concerns] = [Concerns(image: "dentalcare", name: "Dental Care"),
                                        Concerns(image: "dermatologist", name: "Skin & Hair"),
                                        Concerns(image: "digestive", name: "Digestive Issues"),
                                        Concerns(image: "ent", name: "Ear Nose Throat"),
                                        Concerns(image: "eye", name: "Eye Specialist"),
                                        Concerns(image: "fetus", name: "Child Specialist"),
                                        Concerns(image: "gynaecology", name: "Women's Health"),
                                                                            Concerns(image: "homeopahty", name: "Homeopathy"),
                                                                            Concerns(image: "humanbone", name: "Bone & Joints"),
                                                                            Concerns(image: "mentalhealth", name: "Mental Wellness"),
                                                                            Concerns(image: "sex", name: "Sex Specialist"),
                                                                            Concerns(image: "stethoscope", name: "General Physician"),
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let nibCell = UINib(nibName: reuseIdentifier, bundle: nil)
        
        collectionView.register(nibCell, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        collectionView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Collection View data source methods
    
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return concerns.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCollectionViewCell
//
//        let concern = concerns[indexPath.row]
//
//        cell.itemImageView?.image = UIImage(named: concern.image)
//        cell.itemName?.text = concern.name
//
//        return cell
//    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout methods


    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          collectionView.reloadData()
      }

      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
          let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
          let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
          return CGSize(width: size, height: size)
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


