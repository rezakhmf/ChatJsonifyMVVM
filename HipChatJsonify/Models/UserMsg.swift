//
//  MessageSpecialContent.swift
//  HipChatJsonify
//
//  Created by Reza Farahani on 16/08/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

struct UserMsg {
    
    
    internal var mentions : Array<Mention>?
    internal var emoticons : Array<Emoticon>?
    internal var links : Array<Link>?
    
    internal var dictionary: NSDictionary?;
    
    internal init?(dictionary: NSDictionary) {
        
        if (dictionary["mentions"] != nil) { mentions = (dictionary["mentions"] as! Array<Mention>)}
        if (dictionary["emoticons"] != nil) { emoticons = (dictionary["emoticons"] as! Array<Emoticon>) }
        if (dictionary["links"] != nil) { links = Link.modelsFromDictionaryArray(dictionary["links"] as! NSArray) }
        self.dictionary = dictionary;
    }
    
    
    internal func modelsFromDictionaryArray(array:NSArray) -> [UserMsg]
    {
        var models:[UserMsg] = []
        for item in array
        {
            models.append(UserMsg(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    internal func dictionaryRepresentation() -> NSDictionary {
        return dictionary!;
    }
    
}

