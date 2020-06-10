//
//  ToDoTableTableViewController.swift
//  Todoey
//
//  Created by Liny thomas on 10/06/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

class ToDoTableTableViewController: UITableViewController {
var todoList = ["Groceries", "Travel", "Health"]
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedList = defaults.array(forKey: "ToDoList") as? [String] {
            todoList = savedList
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoList", for: indexPath)
        cell.textLabel?.text = todoList[indexPath.row]
        cell.accessoryType = .none
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

    }

    @IBAction func addTodoItem(_ sender: Any) {
        let alert = UIAlertController(title: "Add Item to List", message: "", preferredStyle: .alert)
        var textField = UITextField()

        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            if let newItem = textField.text {
                self.todoList.append(newItem)
                self.defaults.set(self.todoList, forKey: "ToDoList")

                self.tableView.reloadData()
            }
            print (textField.text ?? "Empty")
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item "
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
