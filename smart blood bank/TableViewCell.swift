//
//  TableViewCell.swift
//  smart blood bank
//
//  Created by Syed Shahrukh Haider on 05/05/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var bloodCell: UILabel!
    @IBOutlet weak var ageCell: UILabel!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var categoryCell: UILabel!
    
    
    override func awakeFromNib() {

       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
