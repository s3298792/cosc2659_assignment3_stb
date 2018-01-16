//
//  CellDelegate.swift
//  cosc2659_assignment3_stb
//
//  Created by rmit on 1/16/18.
//
//

import Foundation

protocol CellDelegate {
    
    func nameTextFieldEditingDidEnd(cell: EditTableViewCell, name: String)
    
    func amountTextFieldEditingDidEnd(cell: EditTableViewCell, amount: Int)
    
    func deleteButtonClick(cell: EditTableViewCell)
    
    
}
