//
//  CustomTableViewCell.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var doctName: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var doctImage: UIImageView!
    
    @IBOutlet weak var clinicAddress: UILabel!
    
    @IBOutlet weak var fees: UILabel!
    
    
    
    @IBAction func bookAppointment(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        viewOne.layer.shadowOffset = CGSize(width: 3,
                                          height: 3)
        viewOne.layer.shadowRadius = 2
        viewOne.layer.shadowOpacity = 0.2
        doctImage.layer.masksToBounds = true
         doctImage.layer.cornerRadius = doctImage.bounds.width / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
