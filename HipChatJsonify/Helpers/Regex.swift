//
//  Regex.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 5/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

class Regex {

    
    func matchesForRegexInText(regex: String, input: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex, options: .CaseInsensitive);
            let nsInput = input as NSString;
            let matches = regex.matchesInString(input as String,
                                                options: [], range: NSMakeRange(0, nsInput.length));
            return matches.map { nsInput.substringWithRange($0.range)};
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)");
            return [];
        }
    }
    
}




