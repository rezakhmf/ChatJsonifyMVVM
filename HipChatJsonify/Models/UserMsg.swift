//
//  MessageSpecialContent.swift
//  HipChatJsonify
//
//  Created by Reza Farahani on 16/08/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

protocol UserMsgModel: Model {
    var mentions : Array<Mention>? {get set}
    var emoticons : Array<Emoticon>? {get set}
    var links : Array<Link>? {get set}
}

struct UserMsg: UserMsgModel,JSONSerializable{
    
    var mentions : Array<Mention>?
    var emoticons : Array<Emoticon>?
    var links : Array<Link>?
    
    func dictionaryRepresentation() -> Dictionary<String,Any> {
        
        let mentions = self.mentions!.map{$0.name}
        let emoticons = self.emoticons!.map{$0.name}
        let LinkT = self.links!.map{$0.toJSON()!}
        
        var userMsgDict = [String:Any]()
        
        if (userMsgDict["mentions"] == nil){userMsgDict["mentions"] = mentions }
        if (userMsgDict["emoticons"] == nil){userMsgDict["emoticons"] =  emoticons }
        if (userMsgDict["links"] == nil){userMsgDict["links"] = LinkT }
        
        var result = [String: AnyObject]();
        for (key, value) in (userMsgDict) {
            if let v = value as? AnyObject {
                result[key] = v
            }
        }
        return userMsgDict
        
    }
}

