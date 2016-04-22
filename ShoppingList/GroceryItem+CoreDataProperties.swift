//
//  GroceryItem+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Diego Aguirre on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension GroceryItem {

    @NSManaged var title: String
    @NSManaged var date: NSDate
    @NSManaged var isChecked: NSNumber

}
