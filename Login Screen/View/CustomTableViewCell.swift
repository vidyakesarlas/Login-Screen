//
//  CustomTableViewCell.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject{
    func didTapButton(with title: String, index: Int)
}
class CustomTableViewCell: UITableViewCell {

    var cellIndex: Int = 0
 
    weak var delegate: MyTableViewCellDelegate?
 
    var okSelected: Bool = false
    
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var doctName: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var doctImage: UIImageView!
    @IBOutlet weak var clinicAddress: UILabel!
    @IBOutlet weak var fees: UILabel!
    @IBOutlet weak var viewtwo: UIView!
    @IBOutlet weak var bookAppointmentt: UIButton!
  
    var popup: PopUpWindow?

    private var title: String = ""

    @IBAction func didTapButton(){
        
        delegate?.didTapButton(with: title, index: cellIndex)
        
    }

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
        bookAppointmentt.layer.cornerRadius = 8

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

}
