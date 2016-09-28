//
//  Utils.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 22/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

struct Util{
    
}

extension Util{
    
    static func findByRegex(withRegex pattern: String, input text: String) -> [String]{
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
}

extension Util {
    
     static func dictiionaryToJsonString(dictionary: Dictionary<String,[Any]>) -> String {
        do {
           // let dict = dictionary as NSDictionary
//            let data = try NSJSONSerialization.dataWithJSONObject(dictionary, options:[])
//            
//            let dataString = NSString(data: data, encoding: NSUTF8StringEncoding)!
//            return dataString as String;
            
        } catch {
            print("JSON serialization failed:  \(error)")
        }
        return "";
    }
}

extension Util {
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