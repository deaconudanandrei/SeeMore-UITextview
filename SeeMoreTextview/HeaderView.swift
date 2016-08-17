//
//  HeaderView.swift
//  SeeMoreTextview
//
//  Created by Deaconu Dan Andrei cu "A" mare on 17/08/16.
//  Copyright © 2016 BadBoys. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var buttonProfilePhoto: UIButton!
    @IBOutlet weak var buttonUsername: UIButton!
    
    var photo: Photo? {
        didSet{
            // photo is an optional so we need to unwrap it
            if let photo = photo {
                
                // set username and profile photo
                buttonProfilePhoto.setImage(photo.profilePhoto, forState: .Normal)
                buttonUsername.setTitle(photo.username, forState: .Normal)
                
                // make the button a circle
                buttonProfilePhoto.layer.cornerRadius = buttonProfilePhoto.bounds.height / 2
                buttonProfilePhoto.clipsToBounds = true
                
                // set the background color to white in order to avoid blended colors
                buttonProfilePhoto.backgroundColor = UIColor.whiteColor()
                
                // set the title background color of the button to white in order to avoid blended colors
                buttonUsername.titleLabel?.backgroundColor = UIColor.whiteColor()
            }
        }
    }
}
