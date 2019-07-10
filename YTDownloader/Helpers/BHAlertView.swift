//
//  AppDelegate.swift
//  GetProject
//
//  Created by YasserDeev on 19/01/2019.
//  Copyright © 2019 YasserDeev. All rights reserved.
//


import Foundation
import UIKit

open class BHAlert: UIAlertController {
    
    
    func ShowBHAlertController(Title: String, message: String,TitleButton: String, Target: UIViewController) {
        let BHVC = UIAlertController(title: Title, message: message, preferredStyle: .alert)
        let BHAction = UIAlertAction(title: TitleButton, style: .default, handler: nil)
        BHVC.addAction(BHAction)
        Target.present(BHVC, animated: true, completion: nil)
        
    }
}
