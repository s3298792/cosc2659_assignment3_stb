//
//  ViewController.swift
//  cosc2659_assignment3_stb
//
//  Created by rmit on 1/16/18.
//
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var categories = [Category]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
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
        
        let category1 = Category(name: "Leisure", amount: 100000)
        let category2 = Category(name: "Love", amount: 300000)
        let category3 = Category(name: "Social", amount: 200000)
        categories += [category1, category2, category3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "Edit":
            let destination = segue.destination as! EditViewController
            destination.categories = categories
        default:
            return
        }
    }


}

