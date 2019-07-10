//
//  AppDelegate.swift
//  GetProject
//
//  Created by YasserDeev on 19/01/2019.
//  Copyright © 2019 YasserDeev. All rights reserved.
//


import Foundation
import UIKit

@IBDesignable
open class BHView: UIView {
    
    @IBInspectable var SetCornerRadiusValue: CGFloat = 0 {
        didSet {
            layer.cornerRadius = SetCornerRadiusValue
            
        }
    }
    
    @IBInspectable var FirstColor: UIColor = .clear {
        didSet {
            setGradientColor()
        }
    }
    
    @IBInspectable var SecondColor: UIColor = .clear {
        didSet {
            setGradientColor()
        }
    }
    override open class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
        
    }
    
    func setGradientColor() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor]
    }
    
}

