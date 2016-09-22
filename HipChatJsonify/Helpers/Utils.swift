//
//  Utils.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 22/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

public struct Utils {}


extension Utils {
    
    public static func dictiionaryToJsonString(dictionary: NSDictionary) -> String {
        do {
            let data = try NSJSONSerialization.dataWithJSONObject(dictionary, options:[])
            
            let dataString = NSString(data: data, encoding: NSUTF8StringEncoding)!
            return dataString as String;
            
        } catch {
            print("JSON serialization failed:  \(error)")
        }
        return "";
    }
}