//
//  Emoticons.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 26/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

struct Emoticon {
    var name:String;
    
    /**
     Constructs the object based on the given string.
     
     Sample usage:
     let emoticons = Emoticons(string)
     
     - parameter name:  String from JSON.
     
     - returns: Emoticons Instance.
     */
    internal init?(name: String) {
        
        self.name = name;
    }
}
