//
//  CustomView.swift
//  Freebie
//
//  Created by Vishal Vasan on 11/16/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    let SHADOW_GRAY: CGFloat = 120.0 / 255.0
    
    override func awakeFromNib() {
        
        layer.shadowColor = UIColor(colorLiteralRed: Float(SHADOW_GRAY), green: Float(SHADOW_GRAY), blue: Float(SHADOW_GRAY), alpha: 0.6).cgColor
        
        layer.shadowOpacity = 0.8
        
        layer.borderColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0).cgColor
        
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        layer.borderWidth = 2.0
        
    }
}
