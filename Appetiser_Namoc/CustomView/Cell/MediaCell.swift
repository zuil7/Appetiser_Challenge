//
//  MediaCell.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 26/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {

    @IBOutlet var artWorkImg: UIImageView!
    @IBOutlet var trackNameLbl: UILabel!
    @IBOutlet var genreLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    
    func configureCell(media: MediaResult){
        self.trackNameLbl.text = media.trackName
        self.genreLbl.text = media.primaryGenreName
        if let price = media.trackPrice{
            self.priceLbl.text = String(format: "$ %.2f", price)
        }else{
            self.priceLbl.text = "$ 0.00"
        }
        self.artWorkImg.fetchImage(url: media.artworkUrl100!)

    }

}
