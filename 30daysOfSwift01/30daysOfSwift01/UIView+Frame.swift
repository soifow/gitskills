//
//  UIView+Frame.swift
//  30daysOfSwift01
//
//  Created by soifow on 2018/3/20.
//  Copyright © 2018年 zlycare. All rights reserved.
//

import UIKit

extension UIView {
    //x position
    var x : CGFloat{
        get {
            return frame.origin.x
        }
        
        set(newVal){
            var tempFrame : CGRect = frame
            tempFrame.origin.x     = newVal
            frame                  = tempFrame
        }
    }
    
    //y position
    var y : CGFloat{
        get {
            return frame.origin.y
        }
        
        set(newVal){
            var tempFrame : CGRect = frame
            tempFrame.origin.y     = newVal
            frame                  = tempFrame
        }
    }
    
    //height
    var height : CGFloat{
        get {
            return frame.size.height
        }
        
        set(newVal){
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    // width
    var width : CGFloat {
        get {
            return frame.size.width
        }
        
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    // left
    var left : CGFloat {
        get {
            return x
        }
    }
    
    // right
    var right : CGFloat {
        get {
            return x + width
        }
    }
    
    // top
    var top : CGFloat {
        get {
            return y
        }
    }
    
    // bottom
    var bottom : CGFloat {
        get {
            return y + height
        }
    }
    
    //centerX
    var centerX : CGFloat {
        get {
            return center.x
        }
        
        set(newVal) {
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    //centerY
    var centerY : CGFloat {
        get {
            return center.y
        }
        
        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    //middleX
    var middleX : CGFloat {
        get {
            return x + width / 2
        }
    }
    
    //middleY
    var middleY : CGFloat {
        get {
            return y + height / 2
        }
    }
    
    //middlePoint
    var middlePoint : CGPoint {
        get {
            return CGPoint(x: middleX, y: middleY)
        }
    }
}

