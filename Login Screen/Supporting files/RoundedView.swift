//
//  RoundedView.swift
//  Login Screen
//
//  Created by vidya.k on 22/04/22.
//

import Foundation
import UIKit

class RoundedView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
