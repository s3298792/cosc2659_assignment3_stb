//
//  TableViewCell.swift
//  cosc2659_assignment3_stb
//
//  Created by rmit on 1/16/18.
//
//

import UIKit

//class for creating the cells in the table view of the home view
class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
