//
//  UserTableViewCell.swift
//  TableViewTest
//
//  Created by Rabeb Jaouadi on 05/03/2020.
//  Copyright © 2020 __epita__. All rights reserved.
//

import UIKit
import SDWebImage

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImageView.layer.cornerRadius = posterImageView.frame.height / 2
        posterImageView.clipsToBounds = true
    }

}

