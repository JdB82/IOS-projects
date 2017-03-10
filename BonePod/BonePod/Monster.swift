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
        
        isTheMonsterHappy(human: human)
        
        crunchBones(bones: human.bones)
        
//        
//        if human.type == .boy {
//            print("Monster is Happy")
//        } else if human.type == .boy {
//            print("Grompy old monster")
//        } else if human.type == .woman {
//            print("Not my taste")
//        } else if human.type == .man {
//            print("A lot of meat")
//        } else {
//            print("Ooh yesh a alien")
//        }
//        
//        for currentBone in human.bones {
//            currentBone.crunched = true
//            allCrunchedBones.append(currentBone)
//            switch currentBone.type {
//            case boneType.boyBone:
//                print("crunching boy")
//            case boneType.manBone:
//                print("crunching man")
//            case boneType.womanBone:
//                print("crunching woman")
//            }
//        }
//        
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
    
    func isTheMonsterHappy(human: Human) -> String {
        if human.type == .boy {
            return "Monster is Happy"
        } else if human.type == .boy {
            return "Grompy old monster"
        } else if human.type == .woman {
            return("Not my taste")
        } else if human.type == .man {
            return("A lot of meat")
        } else {
            return("Ooh yesh a alien")
        }
    }
}







