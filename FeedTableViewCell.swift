//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by Alexandra Munoz on 2/21/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var postedImageView: UIImageView!
    @IBOutlet weak var postedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
