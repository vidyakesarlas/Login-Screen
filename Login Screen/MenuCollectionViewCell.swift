//
//  MenuCollectionViewCell.swift
//  Login Screen
//
//  Created by vidya.k on 21/04/22.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
                
        // Initialization code
    }
    

}
