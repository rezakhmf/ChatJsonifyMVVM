//
//  Link.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 12/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//


import Foundation


public struct Link {
    
    public var url : String?
    public var title : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let links_list = Links.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Links Instances.
     */
    public static func modelsFromDictionaryArray(array:NSArray) -> [Link]
    {
        var models:[Link] = []
        for item in array
        {
            models.append(Link(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let links = Links(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Links Instance.
     */
     public init?(dictionary: NSDictionary) {
        
        url = dictionary["url"] as? String
        title = dictionary["title"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.url, forKey: "url")
        dictionary.setValue(self.title, forKey: "title")
        
        return dictionary
    }
    
    public static func StringArrayOfLinksNamefromMessage(msg:String) -> [String]{
        let links = MatchFinder.linkMatches(input: msg);
        return links.count>0 ? links:["no emoticons!"];
    }
    
}