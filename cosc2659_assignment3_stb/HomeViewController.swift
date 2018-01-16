//
//  ViewController.swift
//  cosc2659_assignment3_stb
//
//  Created by rmit on 1/16/18.
//
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var totalExpenseLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    var budget: Int!
    var totalExpense: Int!
    var balance: Int!
    var categories = [Category]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    //control the cells in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        let category = categories[indexPath.row]
        cell.nameLabel.text = category.name
        cell.amountLabel.text = String(category.amount) + " vnd"    
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(budget == nil) {
            budget = 0                            //check if budget is set,if not it will equal 0
        }
        budgetLabel.text = String(budget) + " vnd"
        
        if(totalExpense == nil) {
            totalExpense = 0                    ////check if totalexpense is set,if not it will equal 0
        }
        //display the total expense
        totalExpenseLabel.text = String(totalExpense) + " vnd"
        
        if(balance == nil) {                    //check if balance is set,if not it will equal 0
            balance = 0
        }
        //display the total balance
        balanceLabel.text = String(balance) + " vnd"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {                    //change the value when the user edit
        case "Edit":
            let destination = segue.destination as! EditViewController
            destination.budget = budget
            destination.totalExpense = totalExpense
            destination.balance = balance
            destination.categories = categories
        default:
            return
        }
    }


}

