//
//  Monster.swift
//  BonePod
//
//  Created by Jeroen de Bie on 19/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import Foundation

// 11) A: 5.

class Monster{
    var age: Int
    var name: String
    var monsterTeeth: teethType
    
    var allCrunchedBones: [Bone] = []
    
    init(age: Int, name: String, monsterTeeth: teethType) {
        self.age = age
        self.name = name
        self.monsterTeeth = monsterTeeth
    }

// 12) A:4. - B:4. - C:1. - D:4.
// 13) A:2
    
    func eatHuman(human: Human) -> [Bone] {
        if human.type == .boy {
            human.die()
            print("Yummy i like eating boys")
        } else {
            print("Yuck")
        }
        
        crunchBones(bones: human.bones)
        return allCrunchedBones
    }
    
    func eatManyHumans(humans: [Human]) -> [Bone] {
        for human in humans {
            crunchBones(bones: human.bones)
        }
        return allCrunchedBones
    }
    
    func crunchBones(bones: [Bone]) {
        for currentBone in bones {
            crunch(bone: currentBone)
        }
    }

    func crunch(bone: Bone) {
        bone.crunched = true
        allCrunchedBones.append(bone)
        switch bone.type {
        case boneType.boyBone:
            print("crunching boy")
        case boneType.manBone:
            print("crunching man")
        case boneType.womanBone:
            print("crunching woman")
        }
    }
        
}







