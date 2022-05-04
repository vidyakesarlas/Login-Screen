//
//  DestViewController.swift
//  Login Screen
//
//  Created by vidya.k on 02/05/22.
//

import UIKit

class DestViewController: UIViewController {

    var x: String?
    
    @IBOutlet weak var labl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labl.text = x
        print(x)
        // Do any additional setup after loading the view.
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
