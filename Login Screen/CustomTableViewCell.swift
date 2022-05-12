//
//  CustomTableViewCell.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject{
    func didTapButton(with title: String)
}


class CustomTableViewCell: UITableViewCell {

  
    weak var delegate: MyTableViewCellDelegate?
    

    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var doctName: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var doctImage: UIImageView!
    
    @IBOutlet weak var clinicAddress: UILabel!
    
    @IBOutlet weak var fees: UILabel!
    
    
    
    
    @IBOutlet weak var viewtwo: UIView!
    @IBOutlet weak var bookAppointmentt: UIButton!
    
    private var title: String = ""
    
    @IBAction func didTapButton(){
        delegate?.didTapButton(with: title)
      
        bookAppointmentt.setTitle("Appointment booked!", for: .normal)
       
        
    }
    
    func configure(with title: String){
        self.title = title
        bookAppointmentt.setTitle(title, for: .normal)
    }
    
    
        
//        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpVC") as! PopupViewController
//             self.addChild(popUpVC)
//             popUpVC.view.frame = self.view.frame
//             self.view.addSubview(popUpVC.view)
//
//             popUpVC.didMove(toParent: self)
        
        // Load and configure your view controller.
//           let storyboard = UIStoryboard(name: "Main", bundle: nil)
//           let optionsVC = storyboard.instantiateViewController(
//                      withIdentifier: "PopoverViewController")
//
//           // Use the popover presentation style for your view controller.
//           optionsVC.modalPresentationStyle = .popover
//
//           // Specify the anchor point for the popover.
//        optionsVC.popoverPresentationController?. =
//
//           // Present the view controller (in a popover).
//           self.present(optionsVC, animated: true) {
//              // The popover is visible.
        
    
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        viewOne.layer.shadowOffset = CGSize(width: 1,
                                          height: 1)
        viewOne.layer.shadowRadius = 1
        viewOne.layer.shadowOpacity = 0.2
        doctImage.layer.masksToBounds = true
         doctImage.layer.cornerRadius = doctImage.bounds.width / 2
        viewOne.layer.backgroundColor = UIColor.colorFromHex("#F5F5F5").cgColor
        viewtwo.layer.backgroundColor = UIColor.colorFromHex("#F5F5F5").cgColor
        
        bookAppointmentt.setTitleColor(.link, for: .normal)
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
