//
//  MenuCollectionViewCell.swift
//  Login Screen
//
//  Created by vidya.k on 21/04/22.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 8.0
        cellView.layer.masksToBounds = true
        cellView.layer.backgroundColor = UIColor.colorFromHex("#FAFAFA").cgColor
        // Initialization code
    }
    

}
