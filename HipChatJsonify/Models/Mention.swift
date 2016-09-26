//
//  Mentions.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 26/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

public class Mention {
    
    internal var name: String?
    
    /**
     Constructs the object based on the given String.
     
     Sample usage:
     let emoticons = Mentions(string)
     
     - parameter name:  String from JSON.
     
     - returns: Mentions Instance.
     */
 public init?(name: String) {
        
        self.name = name;
    }
    
    public static func modelsFromDictionaryArray(array:NSArray) -> [Mention]
    {
        var models:[Mention] = []
        for item in array
        {
            models.append(Mention(name: item as! String)!)
        }
        return models
    }
    
    public static func StringArrayOfMentionsNamefromMessage(msg:String) -> [String]{
           let mentions = MatchFinder.capturedGroups(withRegex:"\\((.*?)\\)", input: msg);
        return mentions.isEmpty ? ["no mentions!"]: mentions;
    }

    
}
