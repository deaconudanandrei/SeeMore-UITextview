//
//  Photo.swift
//  SeeMoreTextview
//
//  Created by Deaconu Dan Andrei cu "A" mare on 17/08/16.
//  Copyright © 2016 BadBoys. All rights reserved.
//

import UIKit

class Photo {
    
    var profilePhoto: UIImage
    var username: String
    var photo: UIImage
    var content: String
    
    init(profilePhoto: UIImage, username: String, photo: UIImage, content: String) {
        self.profilePhoto = profilePhoto
        self.username = username
        self.photo = photo
        self.content = content
    }
    
}