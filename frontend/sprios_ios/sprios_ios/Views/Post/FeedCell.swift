//
//  FeedCell.swift
//  sprios_ios
//
//  Created by 이정동 on 2022/11/30.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var account: UILabel!
    
    @IBOutlet weak var accountBotLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var content: UILabel!
    
    @IBOutlet weak var createdAt: UILabel!
    
    var dateCreated: Date? 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}