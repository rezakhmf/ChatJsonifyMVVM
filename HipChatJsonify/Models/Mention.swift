//
//  Mentions.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 26/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation


public struct Mention: EmoticonMentionModel {
    
    var name: String;
    
    public init?(name: String) {
        self.name = name;
    }
    
}

