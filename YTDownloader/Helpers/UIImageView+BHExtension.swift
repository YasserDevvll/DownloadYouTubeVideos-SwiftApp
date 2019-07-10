///
//  AppDelegate.swift
//  GetProject
//
//  Created by YasserDeev on 19/01/2019.
//  Copyright © 2019 YasserDeev. All rights reserved.
//


import Foundation
import UIKit

@IBDesignable
open class BHImageView: UIImageView {
    
    @IBInspectable var CornerRadiusOfImageView: CGFloat = 0 {
        didSet {
            layer.cornerRadius = CornerRadiusOfImageView
            layer.masksToBounds = true
            clipsToBounds = true
        }
    }
    
}
