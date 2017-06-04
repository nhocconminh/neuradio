//
//  CoverFacebookTableViewCell.swift
//  Neu Radio
//
//  Created by Minh Vo on 6/4/17.
//  Copyright © 2017 minhvo. All rights reserved.
//

import UIKit

class CoverFacebookTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    @IBOutlet weak var numberOfTalkingAboutThis: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
