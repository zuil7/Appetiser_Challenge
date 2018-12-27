//
//  NetworkService.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 24/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import UIKit
import Alamofire

typealias ServiceResultBlock<T> = ((_ results: T) -> Void)
typealias ServiceFailedBlock<T> = ((_ error: T) -> Void)

let OK_CODE = 200

class NetworkService: Alamofire.SessionManager {
    static let shared = NetworkService()

    // MARK: Request Itunes API Search
    func requestGETItunes(completionBlock:@escaping ServiceResultBlock<AnyObject>,failureBlock: @escaping ServiceFailedBlock<AnyObject>){
        
        let api_Url = API_URL + EP.ItunesAPI
        
        Alamofire.request(api_Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch(response.result){
            case .success(_):
                if response.response?.statusCode == OK_CODE{
                    completionBlock(response.result.value as AnyObject)
                }
                break
            case .failure(let error):
                failureBlock(error as AnyObject)
                break
            }
        }
    }
}

