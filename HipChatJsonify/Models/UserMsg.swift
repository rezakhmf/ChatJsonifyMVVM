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
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let userMsg = UserMsg.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Json4Swift_Base Instances.
     */
    internal func modelsFromDictionaryArray(array:NSArray) -> [UserMsg]
    {
        var models:[UserMsg] = []
        for item in array
        {
            models.append(UserMsg(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let yserMsg = UserMsg(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     */
     internal init?(dictionary: NSDictionary) {
        
        if (dictionary["mentions"] != nil) { mentions = (dictionary["mentions"] as! Array<Mention>)}
        if (dictionary["emoticons"] != nil) { emoticons = (dictionary["emoticons"] as! Array<Emoticon>) }
        if (dictionary["links"] != nil) { links = Link.modelsFromDictionaryArray(dictionary["links"] as! NSArray) }
        self.dictionary = dictionary;
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    internal func dictionaryRepresentation() -> NSDictionary {
        return dictionary!;
    }
    
}

