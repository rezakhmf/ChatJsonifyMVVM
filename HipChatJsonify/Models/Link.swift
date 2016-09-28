//
//  Link.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 12/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//


import Foundation

protocol LinkModel: Model {
    var url : String? {get set}
    var title : String? {get set}
    init(dictionary: NSDictionary)
}

public struct Link: LinkModel{
   
    var url : String?
    var title : String?
    
    public init(dictionary: NSDictionary) {
        url = dictionary["url"] as? String
        title = dictionary["title"] as? String
    }
    
}

extension Link {
    
    static func modelsFromDictionaryArray(array:NSArray) -> [Link]
    {
        var links:[Link] = []
        for item in array
        {
            links.append(Link(dictionary: item as! NSDictionary))
        }
        return links
    }
    
}

extension Link {
    
    func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.url, forKey: "url")
        dictionary.setValue(self.title, forKey: "title")
        
        return dictionary
    }

}
    


