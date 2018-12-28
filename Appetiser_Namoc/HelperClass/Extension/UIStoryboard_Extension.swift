//
//  UIStoryboard_Extension.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 28/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIStoryboard
extension UIStoryboard{
    static func SB_LoadBoard(boardName: String, storyBoardID: String) -> AnyObject {
        let storyboard = UIStoryboard(name:boardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: storyBoardID)
        return vc;
    }
}
