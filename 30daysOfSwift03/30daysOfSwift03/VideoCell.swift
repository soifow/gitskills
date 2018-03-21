//
//  VideoCell.swift
//  30daysOfSwift03
//
//  Created by soifow on 2018/3/21.
//  Copyright © 2018年 zlycare. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    let SRC_WIDTH = UIScreen.main.bounds.width
    
    var videoScreenshot: UIImageView?
    var fakePlayBtn: UIImageView = UIImageView()
    var videoTitleLabel: UILabel?
    var videoSourceLabel: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    func setUpUI() {
        videoScreenshot = UIImageView(frame: CGRect(x: 0, y: 0, width: SRC_WIDTH, height: 220))
        videoScreenshot?.layer.masksToBounds = true
        self.addSubview(videoScreenshot!)
        
        fakePlayBtn = UIImageView(frame: CGRect(x: SRC_WIDTH/2.0 - 30, y: 110 - 30, width: 60, height: 60))
        fakePlayBtn.image = UIImage(named: "playBtn")
        fakePlayBtn.layer.masksToBounds = true
        self.addSubview(fakePlayBtn)
        
        videoTitleLabel = UILabel(frame: CGRect(x: 0, y: fakePlayBtn.frame.origin.y + fakePlayBtn.frame.size.height + 15,
                                                width: SRC_WIDTH, height: 20))
        videoTitleLabel?.font = UIFont.systemFont(ofSize: 16)
        videoTitleLabel?.textColor = UIColor.white
        videoTitleLabel?.textAlignment = .center
        self.addSubview(videoTitleLabel!)
        
        videoSourceLabel = UILabel(frame: CGRect(x: 0, y: 220 - 30, width: SRC_WIDTH, height: 17))
        videoSourceLabel?.font = UIFont.systemFont(ofSize: 14)
        videoSourceLabel?.textColor = UIColor.white
        videoSourceLabel?.textAlignment = .center
        self.addSubview(videoSourceLabel!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

