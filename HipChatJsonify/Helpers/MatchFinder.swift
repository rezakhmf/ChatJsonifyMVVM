//
//  Regex.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 5/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation


struct MatchFinder {
    
    // MARK: – Helper classer to get matches based on regex pattern
    
    static func capturedGroups(withRegex pattern: String, input text: String) -> [String] {
        var results = [String]()
        
        var regex: NSRegularExpression
        do {
            regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
        } catch {
            return results
        }
        
        let matches = regex.matchesInString(text, options: [], range: NSRange(location:0, length: text.characters.count))
        
        for match in matches {
            let capturedGroupIndex = match.rangeAtIndex(1)
            let matchedString = (text as NSString).substringWithRange(capturedGroupIndex)
            results.append(matchedString)
        }
        
        return results
    }
    
    // MARK: – Helper classer to get links on an input string
        //this method is used as cover all types of links e.g. ftp, https and so on.
    
    static func linkMatches(input input: String) -> [String] {
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




