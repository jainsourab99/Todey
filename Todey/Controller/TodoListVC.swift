//
//  ViewController.swift
//  Todey
//
//  Created by Sourabh Jain on 15/07/19.
//  Copyright © 2019 Sourabh Jain. All rights reserved.
//

import UIKit

class TodoListVC: UITableViewController {
    
    var item = [dataItem]()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let items = defaults.array(forKey: "item") as? [String] {
//            item = items
//        }
        let newItem = dataItem()
        newItem.title = "Find Mike"
        newItem.done = true
        item.append(newItem)
        if let items = defaults.array(forKey: "item") as? [dataItem]{
            item = items
        }
        
    }
    
    //MARK:- TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDOitemCell", for: indexPath)
        
        let itemarray = item[indexPath.row]
        
        cell.textLabel?.text = itemarray.title
        
        cell.accessoryType = itemarray.done  ? .checkmark : .none
        
//        if(itemarray.done == true){
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        return(cell)
    }
    
    //MARK:- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        item[indexPath.row].done = !item[indexPath.row].done
     
        tableView.reloadData()
        
//        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//
//        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- Add new Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = dataItem()
            newItem.title = textField.text!
            
            self.item.append(newItem)
            
            self.defaults.setValue(self.item, forKey: "item")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    

}

