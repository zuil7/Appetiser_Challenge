//
//  MasterViewModel.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 24/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import UIKit

class MasterViewModel {

    var didUpdate: (() -> Void)?
    var hasError: ((NSError) -> Void)?
    
    var mediaResult:[MediaResult] = []
    
    // MARK: Request Search Media List
    func searchMedia(){
        Connection.shared.hasConnection { (result) in
            if result{
                NetworkService.shared.requestGETItunes(completionBlock: { (result) in
                    guard let itunesModel = ItunesModel(json: result as! [String:Any]) else {
                        // handle decoding failure here
                        return
                    }
                    self.mediaResult = itunesModel.results!
                    self.didUpdate!()

                }, failureBlock: { (error) in
                    self.hasError!(error as! NSError)
                })
            }
        }
    }
    
   

}
