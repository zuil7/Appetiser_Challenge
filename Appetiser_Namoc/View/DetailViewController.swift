//
//  DetailViewController.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 24/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var trackNameLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var longDescTV: UITextView!
    @IBOutlet var artWorkImg: UIImageView!

    var media:MediaSelected? = nil
    var detailViewModel = DetailViewModel()

   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie Details"
        self.loadValues()
    }
    
    // MARK - ALL LOGIC

    func loadValues() {
        if let trackName = self.media?.trackName{
            self.trackNameLbl.text = trackName
        }
        if let genre = self.media?.primaryGenreName{
            self.genreLbl.text = genre
        }
        if let price = self.media?.trackPrice.value{
            self.priceLbl.text = String(format: "$ %.2f",price)
        }
        if let longDesc = self.media?.longDescription{
            self.longDescTV.text = longDesc
        }
        if let imageURL = self.media?.artworkUrl100{
            self.artWorkImg.fetchImage(url: imageURL)
        }

    }


}

