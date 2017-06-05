//
//  customButton.swift
//  smart blood bank
//
//  Created by Syed Shahrukh Haider on 05/06/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit

@IBDesignable class customButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 0 {
    
        didSet{
        layer.cornerRadius = cornerRadius
        }
    }
}
