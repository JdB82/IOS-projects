//
//  ShoppingListTableViewCell.swift
//  MyFirstTableViewProject
//
//  Created by Jeroen de Bie on 26/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var shoppingListImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataForTableViewCell(shoppingListItem: ShoppingItem) {
        
        self.titleLabel?.text = shoppingListItem.nameShoppingItem
        self.detailTextView?.text = "Price: \(shoppingListItem.priceShoppingItem)"
        self.shoppingListImageView?.image = #imageLiteral(resourceName: "Shoppinglist icon")
    }

    
}

