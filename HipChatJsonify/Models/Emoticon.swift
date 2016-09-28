//
//  Emoticons.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 26/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation



public struct Emoticon: EmoticonMentionModel {
    
     var name:String;
    
    public init?(name: String) {
        self.name = name;
    }
    
    func modelsFromDictionaryArray(array:NSArray) -> [Emoticon]
    {
        var models:[Emoticon] = []
        for item in array
        {
            models.append(Emoticon(name: item as! String)!)
        }
        return models
    }
    
}
