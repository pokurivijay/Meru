//
//  MenuTVCell.swift
//  Meru Demo
//
//  Created by Steve on 02/08/18.
//  Copyright © 2018 VJ. All rights reserved.
//

import UIKit

class MenuTVCell: UITableViewCell {

    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuTitleLabel: UILabel!
    
    @IBOutlet weak var versionStackView: UIStackView!
    @IBOutlet weak var versionNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
