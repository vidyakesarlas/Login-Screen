//
//  MenuViewController.swift
//  Login Screen
//
//  Created by vidya.k on 21/04/22.
//

import UIKit

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   

    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    let menuID = "MenuCollectionViewCell"
    
    
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

        
        let nibCell = UINib(nibName: menuID, bundle: nil)
        
        menuCollectionView.register(nibCell, forCellWithReuseIdentifier: menuID)
        
        menuCollectionView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return concerns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuID, for: indexPath) as! MenuCollectionViewCell
        
        let concern = concerns[indexPath.row]
        
        cell.imageView.image = UIImage(named: concern.image)
        cell.labelName.text = concern.name
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let inset: CGFloat = 10
        
       return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: 80)
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
         let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
         let size:CGFloat = (menuCollectionView.frame.size.width - space) / 2.0
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


    
   

    
    
