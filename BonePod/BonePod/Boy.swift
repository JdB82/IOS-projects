//
//  Boy.swift
//  BonePod
//
//  Created by Jeroen de Bie on 19/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import Foundation

// 7) A: 2.

class Boy: Human {
    
    override init(name: String, type: humanType, bones: [Bone]) {
        super.init(name: name, type: type, bones: bones)
    }
    
    override func die() {
        super.die()
        print("Scream")
    }
}




