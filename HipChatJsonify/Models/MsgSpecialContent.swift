//
//  MessageSpecialContent.swift
//  HipChatJsonify
//
//  Created by Reza Farahani on 16/08/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

class MsgSpecialContent {
    
    var _links:[String] {
    
        get {
            return _links;
        }
        set(newValue) {
            self._links = newValue;
        }
    
    };
    
    var _mentions:[String] {
        get {
            return _emoticons;
        }
        set(newValue) {
            self._emoticons = newValue;
        }
    };
    
    var _emoticons:[String] {
        get {
            return _emoticons;
        }
        set(newValue) {
            self._emoticons = newValue;
        }
    };
    
    
}
