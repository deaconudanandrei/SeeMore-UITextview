//
//  ViewController.swift
//  SeeMoreTextview
//
//  Created by Deaconu Dan Andrei cu "A" mare on 17/08/16.
//  Copyright © 2016 BadBoys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        let johnDoeProfilePhoto = UIImage(named: "johndoe")!
        
        let photo1 = UIImage(named: "autumn")!
        let post1 = Photo(profilePhoto: johnDoeProfilePhoto, username: "johndoe", photo: photo1, content: "Man i love autumn")
        
        let photo2 = UIImage(named: "sand")!
        let post2 = Photo(profilePhoto: johnDoeProfilePhoto, username: "johndoe", photo: photo2, content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        
        let photo3 = UIImage(named: "sea")!
        let post3 = Photo(profilePhoto: johnDoeProfilePhoto, username: "johndoe", photo: photo3, content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        
        let photo4 = UIImage(named: "winter")!
        let post4 = Photo(profilePhoto: johnDoeProfilePhoto, username: "johndoe", photo: photo4, content: "Winter is cold but very beautiful")
        
        photos.append(post1)
        photos.append(post2)
        photos.append(post3)
        photos.append(post4)
        
        //Find out what fonts are available in your application
//        for family: String in UIFont.familyNames() {
//            print("\(family)")
//            for names: String in UIFont.fontNamesForFamilyName(family) {
//                print("== \(names)")
//            }
//        }
        
        // set the delegate and data source for the table view
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource, TextViewCellDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return photos.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let photoCell = tableView.dequeueReusableCellWithIdentifier("PhotoAndContentTableViewCell", forIndexPath: indexPath) as! PhotoAndContentTableViewCell
            
            photoCell.selectionStyle = .None
            photoCell.photo = photos[indexPath.section]
            
            return photoCell
        case 1:
            let descriptionCell = tableView.dequeueReusableCellWithIdentifier("DescriptionTableViewCell", forIndexPath: indexPath) as! DescriptionTableViewCell
            
            descriptionCell.selectionStyle = .None
            descriptionCell.photo = photos[indexPath.section]
            descriptionCell.delegate = self
            
            return descriptionCell
        default:
            let bufferCell = tableView.dequeueReusableCellWithIdentifier("BufferTableViewCell", forIndexPath: indexPath) as! BufferTableViewCell
            
            bufferCell.selectionStyle = .None
            
            return bufferCell
        }
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("HeaderView") as! HeaderView
        
        headerView.photo = photos[section]
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        } else if indexPath.row == 1 {
            return UITableViewAutomaticDimension
        } else {
            return 10
        }
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        } else if indexPath.row == 1 {
            return 70
        } else {
            return 10
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    func textViewCell(cell: DescriptionTableViewCell, didChangeText text: NSAttributedString) {
        let size = cell.textViewContent.frame.size
        let newSize = cell.textViewContent.sizeThatFits(CGSizeMake(size.width, CGFloat.max))
        
        if size.height != newSize.height {
            cell.textViewContent.frame.size = newSize
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
}

