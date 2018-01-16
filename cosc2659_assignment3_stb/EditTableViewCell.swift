//
//  EditTableViewCell.swift
//  cosc2659_assignment3_stb
//
//  Created by rmit on 1/16/18.
//
//

import UIKit

class EditTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    var delegate: CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func nameTextFieldEditingDidEnd(_ sender: UITextField) {
        delegate!.nameTextFieldEditingDidEnd(cell: self, name: nameTextField.text!)
    }
    
    @IBAction func amountTextFieldEditingDidEnd(_ sender: UITextField) {
        delegate!.amountTextFieldEditingDidEnd(cell: self, amount: Int(amountTextField.text!)!)
    }
    
    @IBAction func deleteButtonClick(_ sender: UIButton) {
        delegate!.deleteButtonClick(cell: self)
    }
    
    
}
