//
//  GroceryItemController.swift
//  ShoppingList
//
//  Created by Diego Aguirre on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class GroceryItemController {
    static let sharedInstance = GroceryItemController()
    private let kGroceryItem = "GroceryItem"
    
    var groceries: [GroceryItem] {
        let groceryArray = fetchAllItem()
        return groceryArray
    }
}

extension GroceryItemController {
    func createItem(title: String, date: NSDate, isComplete: Bool) {
        let _ = GroceryItem(title: title, date: date, isComplete: isComplete)
        saveItem()
    }
    
    func fetchAllItem() -> [GroceryItem] {
        let request = NSFetchRequest(entityName: kGroceryItem)
        let context = Stack.sharedStack.managedObjectContext
        
        var groceries: [GroceryItem] = []
        
        do {
            groceries = try context.executeFetchRequest(request) as! [GroceryItem]
            print("Grocery item fetch request successful: \(groceries)")
        } catch let error as NSError {
            print("Fetch failed \(error.localizedDescription) in \(#function)")
        }
        
        groceries.sortInPlace({$0.date.compare($1.date) == NSComparisonResult.OrderedAscending})
        
        return groceries
    }
    
    func saveItem() {
        let context = Stack.sharedStack.managedObjectContext
        
        do {
            let _ = try context.save()
        } catch let error as NSError {
            print("Save failed: \(error.localizedDescription) in \(#function)")
        }
    }
    
    func removeItem(item: GroceryItem) {
        item.managedObjectContext?.deleteObject(item)
        saveItem()
    }
}

extension GroceryItemController {
    func updateCheckValueChanged(groceryItem: GroceryItem, selected: Bool) {
        groceryItem.isChecked = selected
    }
}

















