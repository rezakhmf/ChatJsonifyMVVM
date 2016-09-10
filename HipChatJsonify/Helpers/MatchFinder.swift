//
//  Regex.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 5/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation


class MatchFinder {
    
    // MARK: – Helper classer to get matches based on regex pattern
    
    func matchesInText( input input: String, regexPattern: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: .CaseInsensitive);
            let nsInput = input as NSString;
            let matches = regex.matchesInString(input as String,
                                                options: [], range: NSMakeRange(0, nsInput.length));
            return matches.map { nsInput.substringWithRange($0.range)};
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)");
            return [];
        }
    }
    
    // MARK: – Helper classer to get links on an input string
        //this method is used as cover all types of links e.g. ftp, https and so on.
    
    func linkMatches(input input: String) -> [String] {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingType.Link.rawValue)
            let matches = detector.matchesInString(input, options: [], range: NSRange(location:0, length: input.utf8.count));
            let NSInput = input as NSString;
            return matches.map{NSInput.substringWithRange($0.range)};
        } catch let error as NSError {
            print("no link(s) found: \(error.localizedDescription)");
            return [];
        }
        
    }
}




