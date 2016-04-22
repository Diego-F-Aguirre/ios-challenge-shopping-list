//
//  GroceryListViewController.swift
//  ShoppingList
//
//  Created by Diego Aguirre on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class GroceryListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GroceryListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GroceryItemController.sharedInstance.groceries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as? GroceryItemTableViewCell else { return UITableViewCell() }
        
        let grocery = GroceryItemController.sharedInstance.groceries[indexPath.row]
        cell.updateGroceryListCell(grocery)
        cell.delegate = self
        
        return cell
    }
}

extension GroceryListViewController {
    @IBAction func addItemButtonPressed(sender: AnyObject) {
        let alertController = UIAlertController(title: "Add an item", message: "Enter a item for your grocery list", preferredStyle: .Alert)
        var inputTitleTextField: UITextField?
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        let doneAction = UIAlertAction(title: "Done", style: .Default) { (_) in
            if let inputTitleTextField = inputTitleTextField,
                title = inputTitleTextField.text
            {
                GroceryItemController.sharedInstance.createItem(title, date: NSDate(), isComplete: false)
                self.tableView.reloadData()
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            inputTitleTextField = textField
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(doneAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}

extension GroceryListViewController: UITableViewDelegate {
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let grocery = GroceryItemController.sharedInstance.groceries[indexPath.row]
            GroceryItemController.sharedInstance.removeItem(grocery)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}

extension GroceryListViewController: GroceryListTableViewCellDelegate {
    func checkValueChanged(cell: GroceryItemTableViewCell, selection: Bool) {
        guard let grocery = cell.groceryItem else { return }
        
        GroceryItemController.sharedInstance.updateCheckValueChanged(grocery, selected: selection)
        tableView.reloadData()
    }
}






















