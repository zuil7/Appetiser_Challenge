//
//  UIImageView_Extension.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 26/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import Foundation
import AlamofireImage

extension UIImageView{
    func fetchImage(url: String){
        self.af_setImage(
            withURL: URL(string: url)!,
            placeholderImage:  UIImage(named:"picture"),
            filter: nil,
            imageTransition: .crossDissolve(0.2), completion: { response in
                if (response.result.error != nil){
                    if let image = response.result.value {
                        self.image = image
                    }else{
                        self.image = UIImage(named:"picture")
                    }
                }
        })
    }
}
