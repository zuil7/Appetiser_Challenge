//
//  MediaSelected.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 26/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class MediaSelected: Object {
    dynamic var artworkUrl100: String = ""
    dynamic var primaryGenreName: String = ""
    dynamic var trackName: String = ""
    let trackPrice = RealmOptional<Double>()
    dynamic var longDescription: String = ""
    
}

