//
//  ViewController.swift
//  Todey
//
//  Created by Sourabh Jain on 15/07/19.
//  Copyright © 2019 Sourabh Jain. All rights reserved.
//

import UIKit
import CoreData

class TodoListVC: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var item = [Item]()
    
    var selectedCategory: Category? {
        didSet{
//            loadItem()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBar.delegate = self
//        loadItem()
//        let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        print(dataFilePath)
        
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
        
//        
        return(cell)
    }
    
    //MARK:- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        item[indexPath.row].setValue("Completed", forKey: <#T##String#>)
        //  Delete Operation
//        context.delete(item[indexPath.row])
//        item.remove(at: indexPath.row)
        
        
        
        
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
            
            
//            let newItem = Item(context: self.context)
//            newItem.title = textField.text!
//
//            newItem.done = false
//
//            newItem.parentCategory = self.selectedCategory
//
//            self.item.append(newItem)
            
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
        
        do{
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        self.tableView.reloadData()
    }
    
//    func loadItem(with request: NSFetchRequest<Item> = Item.fetchRequest()){
//
//        //        let request: NSFetchRequest<Item> = Item.fetchRequest()
//        do{
//            item =  try context.fetch(request)
//        } catch {
//            print("\(error)")
//        }
//        tableView.reloadData()
//    }
    
    
//    func loadItem(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil){
//
////        let request: NSFetchRequest<Item> = Item.fetchRequest()
//
//        let categorypredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
//
//        if let additionalPredicate = predicate{
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categorypredicate, additionalPredicate])
//        } else {
//            request.predicate = categorypredicate
//        }
//
////        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categorypredicate,predicate])
////
////        request.predicate = compoundPredicate
//        do{
//        item =  try context.fetch(request)
//        } catch {
//            print("\(error)")
//        }
//        tableView.reloadData()
//    }
}

// MARK:- Search bar methods

//extension TodoListVC: UISearchBarDelegate{
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//        print(searchBar.text!)
//
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//
//         request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//
//
//        loadItem(with: request, predicate: predicate)
//
//
//    }
////    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
////        let request: NSFetchRequest<Item> = Item.fetchRequest()
////        print(searchBar.text!)
////
////        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
////        //        request.predicate = predicate
////
////        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
////
////        //        request.sortDescriptors = [sortDescriptr]
////
////        loadItem(with: request)
////
////        //        do{
////        //            item =  try context.fetch(request)
////        //        } catch {
////        //            print("Error fetching data from contex: \(error)")
////        //        }
////
////
////    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0 {
//            loadItem()
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//
//        }
//    }
//
//
//
//}
//
