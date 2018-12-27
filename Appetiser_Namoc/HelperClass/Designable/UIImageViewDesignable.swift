//
//  UIImageDesignable.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 26/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class UIImageViewDesignable: UIImageView {
    
    @IBInspectable
    public var borderWidth: CGFloat = 0.5 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0.5 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
   
}
