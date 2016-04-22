//
//  GroceryItem.swift
//  ShoppingList
//
//  Created by Diego Aguirre on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class GroceryItem: NSManagedObject {
    static let kClassName = "GroceryItem"

    convenience init?(title: String, date: NSDate, isComplete: Bool, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        guard let entity = NSEntityDescription.entityForName(GroceryItem.kClassName, inManagedObjectContext: context) else { return nil }
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.title = title
        self.date = date
        self.isChecked = isComplete
    }

}
