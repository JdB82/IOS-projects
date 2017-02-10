//
//  Item.swift
//  Homepwner
//
//  Created by Jeroen de Bie on 08/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInEuros: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInEuros: Int) {
        self.name = name
        self.valueInEuros = valueInEuros
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
    }
}
