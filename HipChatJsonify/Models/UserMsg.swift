//
//  MessageSpecialContent.swift
//  HipChatJsonify
//
//  Created by Reza Farahani on 16/08/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

class UserMsg {
    
    internal var mentions : Array<String>?
    internal var emoticons : Array<String>?
    internal var links : Array<Links>?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let userMsg = UserMsg.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Json4Swift_Base Instances.
     */
    internal class func modelsFromDictionaryArray(array:NSArray) -> [UserMsg]
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
    required internal init?(dictionary: NSDictionary) {
        
        if (dictionary["mentions"] != nil) { mentions = (dictionary["mentions"] as! Array<String>)}
        if (dictionary["emoticons"] != nil) { emoticons = (dictionary["emoticons"] as! Array<String>) }
        if (dictionary["links"] != nil) { links = Links.modelsFromDictionaryArray(dictionary["links"] as! NSArray) }
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    internal func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        
        return dictionary
    }
}
