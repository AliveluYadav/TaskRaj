//
//  DeveloperCell.swift
//  TaskR
//
//  Created by LetMeCall Corp on 08/04/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit

class DeveloperCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var IDLbl: UILabel!
    
    @IBOutlet weak var qualificationLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//      self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width /;
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        self.profilePic.clipsToBounds = true;
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
