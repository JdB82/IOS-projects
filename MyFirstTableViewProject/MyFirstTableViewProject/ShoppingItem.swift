//
//  ShoppingItem.swift
//  MyFirstTableViewProject
//
//  Created by Jeroen de Bie on 26/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import Foundation

class ShoppingItem: NSObject {
    
    var nameShoppingItem: String
    var priceShoppingItem: Float
    
    init(nameShoppingItem: String, priceShoppingItem: Float) {
        self.nameShoppingItem = nameShoppingItem
        self.priceShoppingItem = priceShoppingItem
    }
    
}
