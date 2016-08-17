//
//  PhotoAndContentTableViewCell.swift
//  SeeMoreTextview
//
//  Created by Deaconu Dan Andrei cu "A" mare on 17/08/16.
//  Copyright © 2016 BadBoys. All rights reserved.
//

import UIKit

class PhotoAndContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    
    var photo: Photo? {
        didSet{
            // photo is an optional so we need to unwrap it
            if let photo = photo {
                imageViewPhoto.image = photo.photo                
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
