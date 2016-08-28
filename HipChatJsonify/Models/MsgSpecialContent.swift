//
//  MessageSpecialContent.swift
//  HipChatJsonify
//
//  Created by Reza Farahani on 16/08/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

class MsgSpecialContent {
    
    
    var mentions = [String]();
    var emoticons = [String]();
    var links = [String]();
    
    init(mentions:[String], emoticons:[String],links:[String]) {
        
        self.mentions = mentions;
        self.emoticons = emoticons;
        self.links = links;
        
    }
    
    
}
