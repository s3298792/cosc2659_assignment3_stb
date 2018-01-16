//
//  EditViewController.swift
//  cosc2659_assignment3_stb
//
//  Created by rmit on 1/16/18.
//
//

import UIKit

class EditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CellDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var budgetTextField: UITextField!
    @IBOutlet weak var totalExpenseLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var budget: Int!
    var totalExpense: Int!
    var balance: Int!
    var categories: [Category]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EditTableViewCell
        cell.delegate = self
        let category = categories[indexPath.row]
        cell.nameTextField.text = category.name
        cell.amountTextField.text = String(category.amount)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        budgetTextField.text = String(budget)
        budgetTextField.delegate = self
        totalExpenseLabel.text = String(totalExpense) + " vnd"
        balanceLabel.text = String(balance) + " vnd"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func budgetTextFieldEditingDidEnd(_ sender: UITextField) {
        budget = Int(budgetTextField.text!)
        balance = budget - totalExpense
        balanceLabel.text = String(balance) + " vnd"
    }
    
    @IBAction func addButtonClick(_ sender: UIButton) {
        let newCategory = Category(name: "New Name", amount: 0)
        categories.append(newCategory)
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: categories.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    func nameTextFieldEditingDidEnd(cell: EditTableViewCell, name: String) {
        let indexPath = tableView.indexPath(for: cell)!
        let editedCategory = categories[indexPath.row]
        editedCategory.name = name
    }
    
    func amountTextFieldEditingDidEnd(cell: EditTableViewCell, amount: Int) {
        let indexPath = tableView.indexPath(for: cell)!
        let editedCategory = categories[indexPath.row]
        editedCategory.amount = amount
        calculateTotalExpense()
        balance = budget - totalExpense
        balanceLabel.text = String(balance) + " vnd"
    }
    
    func deleteButtonClick(cell: EditTableViewCell) {
        let indexPath = tableView.indexPath(for: cell)!
        categories.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
        tableView.endUpdates()
        calculateTotalExpense()
        balance = budget - totalExpense
        balanceLabel.text = String(balance) + " vnd"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "Home":
            let destination = segue.destination as! HomeViewController
            destination.budget = budget
            destination.totalExpense = totalExpense
            destination.balance = balance
            destination.categories = categories
        default:
            return
        }
    }
    
    private func calculateTotalExpense() {
        totalExpense = 0
        for category in categories {
            totalExpense = totalExpense + category.amount
        }
        totalExpenseLabel.text = String(totalExpense) + " vnd"
    }
    

}
