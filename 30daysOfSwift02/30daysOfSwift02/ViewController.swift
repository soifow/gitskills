//
//  ViewController.swift
//  30daysOfSwift02
//
//  Created by soifow on 2018/3/20.
//  Copyright © 2018年 zlycare. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉", "测试测试测试测试测试测试", "123", "Alex", "@@@@@@"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Gaspar Regular"]
//    var fontNames = ["AppleSDGothicNeo-Thin", "GillSans", "KohinoorTelugu-Medium", "Noteworthy-Bold"]
    
    var fontRowIndex = 0
    var tableView : UITableView = UITableView()
    var changeBtn : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                print(font)
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y + 44, width: self.view.frame.size.width, height: self.view.frame.size.height - 100), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "FontCell")
        self.view.addSubview(tableView)
        
        changeBtn = UIButton(type: .custom)
        changeBtn.frame = CGRect(x: self.view.frame.size.width / 2.0 - 40, y: tableView.frame.origin.y + tableView.frame.size.height + 10, width: 80, height: 40)
        changeBtn.setTitle("改字体", for: .normal)
        changeBtn.setTitleColor(UIColor.black, for: .normal)
        changeBtn.layer.borderColor = UIColor.black.cgColor
        changeBtn.addTarget(self, action: #selector(changeBtnInvoked(_:)), for: .touchUpInside)
        self.view.addSubview(changeBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func changeBtnInvoked(_ sender: UIButton) {
        fontRowIndex = (fontRowIndex + 1) % 4
        print(self.fontNames[fontRowIndex])
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size:16)
        
        return cell
    }
}

