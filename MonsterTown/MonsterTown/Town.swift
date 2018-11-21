//
//  Town.swift
//  MonsterTown
//
//  Created by soifow on 2018/4/24.
//  Copyright © 2018年 zlycare. All rights reserved.
//

import Foundation

struct Town {
    static let region = "South"
    var population = 5_422 {
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation).")
            if oldPopulation > population { //当人口减少时，镇长需要站出来说点什么
                mayor?.saySth()
            }
        }
    }
    //镇长
    var mayor: Mayor?
    
    var numberOfStoplights = 4
    
    enum Size {
        case small
        case medium
        case large
    }
    
    var townSize: Size {
        get {
            switch self.population {
            case 0...10_000:
                return Size.small
            case 10_001...100_000:
                return Size.medium
            default:
                return Size.large
            }
        }
    }
    
    func printDesction() {
        print("Population: \(population), number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
    
}

