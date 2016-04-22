//
//  GroceryItemTableViewCell.swift
//  ShoppingList
//
//  Created by Diego Aguirre on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class GroceryItemTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    var groceryItem: GroceryItem?
    var delegate: GroceryListTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension GroceryItemTableViewCell {
    @IBAction func checkButtonPressed(sender: AnyObject) {
        delegate?.checkValueChanged(self, selection: checkButton.selected)
    }
}

extension GroceryItemTableViewCell {
    func updateGroceryListCell(grocery: GroceryItem) {
        self.groceryItem = grocery
        
        titleLabel.text = grocery.title
        checkButton.selected = grocery.isChecked.boolValue
        
        if grocery.isChecked.boolValue == false {
            titleLabel.textColor = UIColor.grayColor()
            checkButton.imageView?.image = UIImage(named: "incomplete")
            grocery.isChecked = 1
//            checkButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        } else if grocery.isChecked.boolValue == true {
            titleLabel.textColor = UIColor.blackColor()
            checkButton.imageView?.image = UIImage(named: "complete")
            grocery.isChecked = 0
//            checkButton.setImage(UIImage(named: "complete"), forState: .Selected)
        }
    }
}

protocol GroceryListTableViewCellDelegate: class {
    func checkValueChanged(cell: GroceryItemTableViewCell, selection: Bool)
}