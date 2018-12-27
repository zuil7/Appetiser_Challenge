//
//  DetailViewModel.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 26/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import Foundation

typealias DetailResult<T> = ((_ DetailResult : T) -> Void)

class DetailViewModel{
    // MARK: Save selected movie to Realm
    func saveSelectedMedia(media: MediaResult,response: @escaping RealmObjectResult<MediaSelected>){
        let mediaSelected = MediaSelected()
        if let imageURL = media.artworkUrl100{
            mediaSelected.artworkUrl100 = imageURL
        }
        if let genre = media.primaryGenreName{
            mediaSelected.primaryGenreName = genre
        }
        if let trackName = media.trackName{
            mediaSelected.trackName = trackName
        }
        if let trackPrice = media.trackPrice{
            mediaSelected.trackPrice.value = trackPrice
        }
        if let longDesc = media.longDescription{
            mediaSelected.longDescription = longDesc
        }
        RealmServices.shared.clearUserSelected()
        RealmServices.shared.saveRealm(mediaSelected)
        response(mediaSelected)
    }
    
    // MARK: Check what user selected and fetch result
    func checkUserSelected(response: @escaping RealmObjectResult<MediaSelected>){
        RealmServices.shared.getUserSelected { (result) in
            response(result)
        }
    }
    
    
    
}
