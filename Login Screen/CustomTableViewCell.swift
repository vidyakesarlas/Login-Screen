//
//  CustomTableViewCell.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var doctName: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var doctImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
