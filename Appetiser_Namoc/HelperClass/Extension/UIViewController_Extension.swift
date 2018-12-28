//
//  UIViewController_Extension.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 27/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView


extension UIViewController {
    
    func presentAlertWithTitle(title: String, message : String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in print("Youve pressed OK Button")
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
}
extension UIColor {
    static func RGBColor(r: CGFloat,  g: CGFloat,  b: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}

// MARK: - NVActivityIndicatorView
extension NVActivityIndicatorView {
    
    static func showActivityIndicator(message: String,size: CGFloat,color : UIColor, backgroundColor:UIColor? = UIColor.white.withAlphaComponent(0.0))
    {
        NVActivityIndicatorView.DEFAULT_TYPE = .ballPulse
        NVActivityIndicatorView.DEFAULT_COLOR = UIColor.RGBColor(r: 238, g: 98, b: 79)
        NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE = CGSize(width :size, height: size)
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = backgroundColor!
        NVActivityIndicatorView.DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD = 0 // in milliseconds
        NVActivityIndicatorView.DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME = 0 // in milliseconds
        NVActivityIndicatorView.DEFAULT_BLOCKER_MESSAGE = message
        NVActivityIndicatorView.DEFAULT_BLOCKER_MESSAGE_FONT = UIFont.boldSystemFont(ofSize: 20)
        
        let activityData = ActivityData()
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    
    static func hideActivityIndicator()
    {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
}
