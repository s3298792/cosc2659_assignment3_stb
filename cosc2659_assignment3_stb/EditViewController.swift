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
    }       //check the number of item in the categories which will show in the table view
    
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
         //display the total expense
        totalExpenseLabel.text = String(totalExpense) + " vnd"
        //display the balance
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
        budget = Int(budgetTextField.text!)            //change the budgetTextField from text to integer
        balance = budget - totalExpense                //caculate the balance
        balanceLabel.text = String(balance) + " vnd"    //display the balance
    }
    //function add new item for the expense
    @IBAction func addButtonClick(_ sender: UIButton) {
        let newCategory = Category(name: "New Expense", amount: 0)
        categories.append(newCategory)
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: categories.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    func nameTextFieldEditingDidEnd(cell: EditTableViewCell, name: String) {
        let indexPath = tableView.indexPath(for: cell)!
        let editedCategory = categories[indexPath.row]        //change the item of the category to row
        editedCategory.name = name
    }
    
    func amountTextFieldEditingDidEnd(cell: EditTableViewCell, amount: Int) {
        let indexPath = tableView.indexPath(for: cell)!
        let editedCategory = categories[indexPath.row]
        editedCategory.amount = amount
        calculateTotalExpense()
        balance = budget - totalExpense                        //caculate the balance
        balanceLabel.text = String(balance) + " vnd"           //display the balance
    }
    //function for delete an item in category
    func deleteButtonClick(cell: EditTableViewCell) {
        let indexPath = tableView.indexPath(for: cell)!
        categories.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
        tableView.endUpdates()
        calculateTotalExpense()
        balance = budget - totalExpense                     //caculate the balance
        balanceLabel.text = String(balance) + " vnd"           //display the balance
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
    //function for caculate the whole expense
    private func calculateTotalExpense() {
        totalExpense = 0
        for category in categories {
            totalExpense = totalExpense + category.amount           //caculate the total expense
        }
        totalExpenseLabel.text = String(totalExpense) + " vnd"      //display the total expense
    }
    

}
