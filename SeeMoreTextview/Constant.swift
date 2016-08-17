//
//  Constant.swift
//  SeeMoreTextview
//
//  Created by Deaconu Dan Andrei cu "A" mare on 17/08/16.
//  Copyright © 2016 BadBoys. All rights reserved.
//

import Foundation
import UIKit



struct Constant {
    
    struct HelveticaFonts {
        static let HelveticaLight = "HelveticaNeue-Light"
        static let  HelveticaCondensedBold = "HelveticaNeue-CondensedBold"
        static let  HelveticaThin = "HelveticaNeue-Thin"
        static let  HelveticaMedium = "HelveticaNeue-Medium"
        static let  HelveticaUltraLight = "HelveticaNeue-UltraLight"
        static let  HelveticaBold = "HelveticaNeue-Bold"
        static let  HelveticaRegular = "HelveticaNeue"
        static let  HelveticaCondensedBlack = "HelveticaNeue-CondensedBlack"
    }

    static func setFont(font: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: font, size: size)
        
        // we force unwrap it because we know it's going to work
        return font!
    }
    

}
