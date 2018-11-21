//
//  main.swift
//  MonsterTown
//
//  Created by soifow on 2018/4/24.
//  Copyright © 2018年 zlycare. All rights reserved.
//

import Foundation

var myTown = Town()
var theMayor = Mayor()
myTown.mayor = theMayor
let myTownSize = myTown.townSize
print(myTownSize)
myTown.changePopulation(by: 1_000_000)

print("Size: \(myTown.townSize); population: \(myTown.population)")

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDesction()

print("Victim pool:\(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("Victim pool:\(fredTheZombie.victimPool)")
print(Zombie.spookyNoise)

if Zombie.isTerrifying {
    print("Run away!")
}


