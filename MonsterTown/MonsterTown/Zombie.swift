//
//  Zombie.swift
//  MonsterTown
//
//  Created by soifow on 2018/4/24.
//  Copyright © 2018年 zlycare. All rights reserved.
//

import Foundation

class Zombie: Monster {
    static let isTerrifying = true
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    var walksWithLimp = true
    //isFallingApart 私有
//    private var isFallingApart = false
    //外部能读不能改（注意指定时 读取的权限>=写入的权限）
    internal private(set) var isFallingApart = false
    
    //final 关键词标记该方法不能被重写(最终版本)
    final override func terrorizeTown() {
        if !isFallingApart {
            if town!.population < 10 {
                town?.population = 0
            } else {
                town?.changePopulation(by: -10)
            }
        }
        
        super.terrorizeTown()
    }
    
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
}
