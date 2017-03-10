//
//  main.swift
//  BonePod
//
//  Created by Jeroen de Bie on 19/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import Foundation

// 8) A: 4

var boyBones: [Bone] = []

for loopCounter in 1...10{
    var bone = Bone.init(type: .boyBone, crunched: false)
    boyBones.append(bone)
}

// 9 A: 4

var theBoy = Boy.init(name: "Ben", type: humanType.boy, bones: boyBones)

var spaska = Monster.init(age: 250, name: "Spaska", monsterTeeth: teethType.sharpTheeth)

var bonesReturned = spaska.eatHuman(human: theBoy)

for returnBones in bonesReturned {
    print(bonesReturned)
}


print(spaska.isTheMonsterHappy(human: theBoy))








