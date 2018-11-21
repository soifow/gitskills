//
//  Monster.swift
//  MonsterTown
//
//  Created by soifow on 2018/4/24.
//  Copyright © 2018年 zlycare. All rights reserved.
//

import Foundation

class Monster {
    class var spookyNoise: String {
        return "Grrr"
    }
    var town: Town?
    var name = "Monster"
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
            town?.mayor?.knownAttack()  //通知镇长被袭击了
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}


