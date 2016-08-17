//
//  DescriptionTableViewCell.swift
//  SeeMoreTextview
//
//  Created by Deaconu Dan Andrei cu "A" mare on 17/08/16.
//  Copyright © 2016 BadBoys. All rights reserved.
//

import UIKit

protocol TextViewCellDelegate {
    func textViewCell(cell: DescriptionTableViewCell, didChangeText text: NSAttributedString)
}

class DescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textViewContent: UITextView!
    var delegate: TextViewCellDelegate?
    
    var photo: Photo? {
        didSet{
            // photo is an optional so we need to unwrap it
            if let photo = photo {
                handleSeeMore(photo)
            }
        }
    }
    
    func handleSeeMore(photo: Photo) {
        
        let usernameContentAS = usernameContentAttributedString(photo)
        
        if usernameContentAS.string.characters.count >= 140 {
            
            let seeMoreButton = dotsSeeMore()
            
            // set the range of text you want people to see before See more apears
            let range = NSRange(location: 140, length: usernameContentAS.string.characters.count - 140)
            
            // append the dots and See more button
            usernameContentAS.replaceCharactersInRange(range, withAttributedString: seeMoreButton)
            
            // Add tap gesture recognizer to Text View
            let tap = UITapGestureRecognizer(target: self, action: #selector(DescriptionTableViewCell.myMethodToHandleTap(_:)))
            tap.delegate = self
            textViewContent.addGestureRecognizer(tap)
        }

        textViewContent.attributedText = usernameContentAS
        textViewContent.sizeToFit()
    }
    
    func myMethodToHandleTap(sender: UITapGestureRecognizer) {
        
        print("myMethodToHandleTap called")
        
        // Check to see if the sender is textViewTitleContent
        guard let myTextView = sender.view as? UITextView else {return}
        let layoutManager = myTextView.layoutManager
        
        // location of tap in myTextView coordinates and taking the inset into account
        var location = sender.locationInView(myTextView)
        location.x -= myTextView.textContainerInset.left
        location.y -= myTextView.textContainerInset.top
        
        // character index at tap location
        let characterIndex = layoutManager.characterIndexForPoint(location, inTextContainer: myTextView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        // if index is valid then do something.
        if characterIndex < myTextView.textStorage.length - 12 {
            // User has tapped on the content area
            
        } else {
            // User has tapped on the See more button
            
            // the delegate and photo are optionals so we unwrap them with guard statement
            guard let delegate = delegate else {return}
            guard let photo = photo else {return}
            
            let usernameContentAS = usernameContentAttributedString(photo)
            
            textViewContent.attributedText = usernameContentAS
            delegate.textViewCell(self, didChangeText: textViewContent.attributedText)
        }
    }
    
    // This is the full text with the username taken into account
    func usernameContentAttributedString(photo: Photo) -> NSMutableAttributedString {
        // set the username, just as a text will do for now
        let usernameAttributes = [NSFontAttributeName: Constant.setFont(Constant.HelveticaFonts.HelveticaMedium, size: 12), NSForegroundColorAttributeName: UIColor.blackColor()]
        let usernameAttributedString = NSMutableAttributedString(string: "\(photo.username) ", attributes: usernameAttributes)
        
        // set the content
        let contentAttributes = [NSFontAttributeName: Constant.setFont(Constant.HelveticaFonts.HelveticaRegular, size: 12), NSForegroundColorAttributeName: UIColor.lightGrayColor()]
        let contentAttributedString = NSMutableAttributedString(string: "\(photo.content)", attributes: contentAttributes)
        
        usernameAttributedString.appendAttributedString(contentAttributedString)
        return usernameAttributedString
    }
    
    // Dots and See more
    func dotsSeeMore() -> NSMutableAttributedString {
        
        // set see more button
        let seeMoreButtonAttributes = [NSFontAttributeName: Constant.setFont(Constant.HelveticaFonts.HelveticaRegular, size: 12), NSForegroundColorAttributeName: UIColor.grayColor()]
        let seeMoreButton = NSMutableAttributedString(string: "... See more", attributes: seeMoreButtonAttributes)
        
        return seeMoreButton
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
