//
//  YRJokeCell.swift
//  JokeClient-Swift
//
//  Created by YANGReal on 14-6-6.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

import UIKit


class BBSCell: UITableViewCell {
    @IBOutlet var avatarView:UIImageView?
    @IBOutlet var nickLabel:UILabel?
    @IBOutlet var contentLabel:UILabel?
    @IBOutlet var lastdate:UILabel?
    @IBOutlet var View:UIView?
    @IBOutlet var Line:UIView?
    var data :NSDictionary!
    var content:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
        self.setWidth(globalWidth)
        self.contentLabel?.setWidth(globalWidth-85)
        self.Line?.setWidth(globalWidth - 40)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var id = self.data.stringAttributeForKey("id")
        var uid = self.data.stringAttributeForKey("uid")
        var user = self.data.stringAttributeForKey("user")
        var lastdate = self.data.stringAttributeForKey("lastdate")
        content = self.data.stringAttributeForKey("content")
        self.nickLabel!.text = user
        self.lastdate!.text = lastdate
        self.avatarView!.setHead(uid)
        self.avatarView!.tag = uid.toInt()!
        
        var height = content.stringHeightWith(16,width:globalWidth-85)
        
        self.contentLabel!.setHeight(height)
        self.contentLabel!.text = content
        self.Line!.setY(self.contentLabel!.bottom()+25)
        
    }
    class func cellHeightByData(data:NSDictionary)->CGFloat
    {
        var content = data.stringAttributeForKey("content")
        var height = content.stringHeightWith(16,width:globalWidth-85)
        return height + 77 + 26
    }
}
