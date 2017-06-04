//
//  PostFacebookTableViewCell.swift
//  Neu Radio
//
//  Created by Minh Vo on 6/4/17.
//  Copyright © 2017 minhvo. All rights reserved.
//

import UIKit

class PostFacebookTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
