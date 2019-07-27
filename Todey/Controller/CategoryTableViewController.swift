//
//  CategoryTableViewController.swift
//  Todey
//
//  Created by Sourabh Jain on 26/07/19.
//  Copyright © 2019 Sourabh Jain. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class CategoryTableViewController: UITableViewController {
    
    let realm = try! Realm()
    
    
    var categoryItem = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.loadItem()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(categoryItem.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let categoryArray = categoryItem[indexPath.row]
        cell.textLabel?.text = categoryArray.name
        return cell
    }
    
    
    
    // MARK:- Data Manipulation Methods
    
    
    // MARK:- Add new Categories

    

    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            let newItem = Category()
            newItem.name = textField.text!
            self.categoryItem.append(newItem)
            self.saveItems(category: newItem)
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Category"
            textField = alertTextField
        }
        alert.addAction(alertAction)
        present(alert,animated: true, completion: nil)
    }
    
    //MARK:- Model Manupulation Methods
    
    func saveItems(category: Category){
        
        do{
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        self.tableView.reloadData()
    }
//
//    func loadItem(with request: NSFetchRequest<Category> = Category.fetchRequest()){
//
//        //        let request: NSFetchRequest<Item> = Item.fetchRequest()
//        do{
//            categoryItem =  try context.fetch(request)
//        } catch {
//            print("\(error)")
//        }
//        tableView.reloadData()
//    }
    
    
    // MARK:- Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVS = segue.destination as! TodoListVC
        if let indexpath = tableView.indexPathForSelectedRow{
            destinationVS.selectedCategory = categoryItem[indexpath.row]
        }
    }

    

}
