//
//  ShoppingItem.swift
//  MyFirstTableViewProject
//
//  Created by Jeroen de Bie on 26/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import Foundation

class BucketWishes: NSObject {
    
    var bucketWish: String
    var whereToDo: String
    var whenToDo: Float
    
    init(bucketWish: String, whereToDo: String, whenToDo: Float) {
        self.bucketWish = bucketWish
        self.whereToDo = whereToDo
        self.whenToDo = whenToDo
    }
    
}
