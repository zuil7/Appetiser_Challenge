//
//  Connection.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 24/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import UIKit
import Reachability

class Connection: NSObject {
    typealias successBlock = ((_ success: Bool) -> Void)
    static let shared = Connection()
    
    func hasConnection(completion: successBlock){
        let reachability = Reachability()!
        
        if reachability.connection != .none {
            completion(true)
        } else {
            completion(false)
        }
    }
}
