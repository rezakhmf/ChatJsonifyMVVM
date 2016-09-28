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
    
   // internal var dictionary: Dictionary<String,[Any]>?;
    
//    internal init?(dictionary: Dictionary<String,[Any]>) {
//        
//        if (dictionary["mentions"] != nil) { mentions = (dictionary["mentions"] as! Array<Mention>)}
//        if (dictionary["emoticons"] != nil) { emoticons = (dictionary["emoticons"] as! Array<Emoticon>) }
//        if (dictionary["links"] != nil) { links = Link.modelsFromDictionaryArray(dictionary["links"] as! Array<Link>) }
//        self.dictionary = dictionary;
//    }
    
    
//    internal func modelsFromDictionaryArray(array:NSArray) -> [UserMsg]
//    {
//        var models:[UserMsg] = []
//        for item in array
//        {
//            models.append(UserMsg(dictionary: item as! Dictionary<String,[Any]>)!)
//        }
//        return models
//    }
//    
//    internal func dictionaryRepresentation() -> Dictionary<String,[Any]> {
//        return dictionary!;
//    }
    
}

