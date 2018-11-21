//
//  Mayor.swift
//  MonsterTown
//
//  Created by soifow on 2018/4/27.
//  Copyright © 2018年 zlycare. All rights reserved.
//

import Foundation

class Mayor {
    //镇长就职于某个小镇？
//    var town:Town?
    var name:String = "Mr. Mayor"
    //紧张程度
    private var anxietyLevel: Int = 0
    
    //听闻自己的镇子被袭击的消息
    func knownAttack() {
        anxietyLevel += 1
    }
    
    //安抚人民
    func saySth() {
        print("I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of voilence.")
    }
}
