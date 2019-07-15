//
//  ViewController.swift
//  Todey
//
//  Created by Sourabh Jain on 15/07/19.
//  Copyright © 2019 Sourabh Jain. All rights reserved.
//

import UIKit

class TodoListVC: UITableViewController {
    
    let item = ["Find Mike","Buy Eggos","Destory Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDOitemCell", for: indexPath)
        cell.textLabel?.text = item[indexPath.row]
        return(cell)
    }
    
    //MARK:- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    

}

