//
//  Human.swift
//  BonePod
//
//  Created by Jeroen de Bie on 19/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import Foundation

// 6) A: 1 A: 3

class Human {
    var name: String
    var type: humanType
    var bones: [Bone]
    
    init(name: String, type: humanType, bones: [Bone]) {
        self.name = name
        self.type = type
        self.bones = bones
    }
    
    func die(){
        
    }
}
