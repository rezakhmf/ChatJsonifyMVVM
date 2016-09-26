//
//  Emoticons.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 26/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

public struct Emoticon {
    var name:String;
    
    /**
     Constructs the object based on the given string.
     
     Sample usage:
     let emoticons = Emoticons(string)
     
     - parameter name:  String from JSON.
     
     - returns: Emoticons Instance.
     */
    public init?(name: String) {
        
        self.name = name;
    }
    
    public static func modelsFromDictionaryArray(array:NSArray) -> [Emoticon]
    {
        var models:[Emoticon] = []
        for item in array
        {
            models.append(Emoticon(name: item as! String)!)
        }
        return models
    }
    
    public static func StringArrayOfEmoticonsNamefromMessage(msg:String) -> [String]{
        let emoticons = MatchFinder.capturedGroups(withRegex: "\\((.*?)\\)", input: msg);
        return emoticons.isEmpty ? ["no emoticons!"]:emoticons;
    }
}
