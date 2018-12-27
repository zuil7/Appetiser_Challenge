//
//  UIViewController_Extension.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 27/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import Foundation
import UIKit

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
