//
//  ViewController.swift
//  30daysOfSwift01
//
//  Created by soifow on 2018/3/20.
//  Copyright © 2018 zlycare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let timeLabel = UILabel(frame:CGRect(x:self.view.left, y:self.view.top + 20,
                                         width:self.view.width, height:(self.view.height - 20)/2.0))
        timeLabel.textColor = UIColor.black
        timeLabel.text = String(counter)
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: 35)
        timeLabel.tag = 1001
        view.addSubview(timeLabel)
        
        let playBtn = UIButton(type: .custom)
        playBtn.frame = CGRect(x:0, y:timeLabel.bottom,
                               width:self.view.width / 2.0, height:self.view.height - timeLabel.bottom)
        playBtn.setTitle("play", for: .normal)
        playBtn.setTitleColor(UIColor.black, for: .normal)
        playBtn.backgroundColor = UIColor.white
        playBtn.addTarget(self, action: #selector(playBtnInvoked(_:)), for: .touchUpInside)
        view.addSubview(playBtn)
        
        let pauseBtn = UIButton(type: .custom)
        pauseBtn.frame = CGRect(x: playBtn.right, y: playBtn.top, width: playBtn.width, height: playBtn.height)
        pauseBtn.setTitle("pause", for: .normal)
        pauseBtn.setTitleColor(UIColor.white, for: .normal)
        pauseBtn.backgroundColor = UIColor.black
        pauseBtn.addTarget(self, action: #selector(pauseBtnInvoked(_:)), for: .touchUpInside)
        view.addSubview(pauseBtn)
        
        let resetBtn = UIButton(type: .custom)
        resetBtn.frame = CGRect(origin: CGPoint(x:self.view.right - 100, y:self.view.top + 50),
                                size: CGSize(width: 80, height: 30))
        resetBtn.setTitle("reset", for: .normal)
        resetBtn.setTitleColor(UIColor.black, for: .normal)
        resetBtn.addTarget(self, action: #selector(resetBtnInvoked(_:)), for: .touchUpInside)
        view.addSubview(resetBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - btn actions
    @objc func playBtnInvoked(_ sender: UIButton) {
        if (isPlaying) {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @objc func pauseBtnInvoked(_ sender: UIButton) {
        if (!isPlaying) {
            return
        }
        
        timer.invalidate()
        isPlaying = false
    }
    
    @objc func resetBtnInvoked(_ sender: UIButton) {
        timer.invalidate()
        counter = 0.0
        isPlaying = false
        updateLabel(newValue: counter)
    }
    
    @objc func updateTimer() {
        counter = counter + 0.1
        updateLabel(newValue: counter)
    }
    
    func updateLabel(newValue : Double) {
        if let timeLabel = view.viewWithTag(1001) as? UILabel { //如果1001是UIlabel类那么do sth. timeLabel不是UIlabel那么为nil
            timeLabel.text = String(format: "%.1f", newValue)
        }
    }
}

