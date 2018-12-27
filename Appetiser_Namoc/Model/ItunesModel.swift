//
//  ItunesModel.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 24/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import UIKit
import Gloss

struct ItunesModel: JSONDecodable {
    let resultCount: NSInteger?
    let results: [MediaResult]?

    // MARK: - Deserialization
    init?(json: JSON) {
        self.resultCount = "resultCount" <~~ json
        self.results = "results" <~~ json
            
    }
    
    // MARK: - Serialization
    func toJSON() -> JSON? {
        return jsonify([
            "resultCount" ~~> self.resultCount,
            "results" ~~> self.results])
    }
    
}

struct MediaResult: JSONDecodable {

    var artworkUrl100: String?
    var primaryGenreName: String?
    var trackName: String?
    var trackPrice: Double?
    var longDescription: String?

    // MARK: - Deserialization
    init?(json: JSON) {
        self.trackName = "trackName" <~~ json
        self.artworkUrl100 = "artworkUrl100" <~~ json
        self.primaryGenreName = "primaryGenreName" <~~ json
        self.trackPrice = "trackPrice" <~~ json
        self.longDescription = "longDescription" <~~ json

        
    }
    
    // MARK: - Serialization
    func toJSON() -> JSON? {
        return jsonify([
            "trackName" ~~> self.trackName,
            "artworkUrl100" ~~> self.artworkUrl100,
            "primaryGenreName" ~~> self.primaryGenreName,
            "trackPrice" ~~> self.trackPrice,
            "longDescription" ~~> self.longDescription])
    }
    
}
