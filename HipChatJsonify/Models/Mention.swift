//
//  Mentions.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 26/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

struct Mention {
    
    var name:String;
    
    /**
     Constructs the object based on the given String.
     
     Sample usage:
     let emoticons = Mentions(string)
     
     - parameter name:  String from JSON.
     
     - returns: Mentions Instance.
     */
 internal init?(name: String) {
        
        self.name = name;
    }
}
