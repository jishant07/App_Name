//
//  FFirstViewControllerTableViewCell.swift
//  NewTabbed
//
//  Created by admin on 02/05/19.
//  Copyright © 2019 ACEaceaceace. All rights reserved.
//

import UIKit

class FFirstViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
