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
     let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let items = defaults.array(forKey: "item") as? [String] {
//            item = items
//        }
        loadItem()
        
        print(dataFilePath ?? "")

        
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
        saveItems()
        
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
            
           self.saveItems()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    //MARK:- Model Manupulation Methods
    
    func saveItems(){
        let encoder = PropertyListEncoder()
        
        do{
            let data = try encoder.encode(item)
            try data.write(to: dataFilePath!)
        } catch {
            print(error.localizedDescription)
        }
        self.tableView.reloadData()
    }
    func loadItem(){
        
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do{
            item =  try decoder.decode([dataItem].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    

}

