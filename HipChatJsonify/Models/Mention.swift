//
//  Mentions.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 26/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

protocol Model {
    
    var name: String { set get };
    associatedtype ModelType;
    static func modelsFromDictionaryArray(array:NSArray) -> [ModelType];
    
}

protocol Util1 {
    
}


extension Util1 where Self: Model {
    
    func findByRegex(withRegex pattern: String, input text: String) -> [String]{
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




public struct Mention: Model, Util1 {
    
    internal var name: String;
    typealias ModelType = Mention;
    
    /**
     Constructs the object based on the given String.
     
     Sample usage:
     let emoticons = Mentions(string)
     
     - parameter name:  String from JSON.
     
     - returns: Mentions Instance.
     */
 public init?(name: String) {
        
        self.name = name;
    }
    
    public static func modelsFromDictionaryArray(array:NSArray) -> [Mention]
    {
        var models:[Mention] = []
        for item in array
        {
            models.append(Mention(name: item as! String)!)
        }
        return models
    }
    
  

    
}

let men = Mention(name: "hi");
men?.findByRegex(withRegex: <#T##String#>, input: <#T##String#>)
