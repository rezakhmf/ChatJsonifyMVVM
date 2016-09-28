//
//  Link.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 12/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//


import Foundation

protocol LinkModel: Model {
    var url : String {get set}
    var title : String {get set}
    init(url: String,title: String)
    //init(dictionary: Dictionary<String,String>)
}

public struct Link: LinkModel,JSONSerializable{
   
    var url: String
    var title: String
    
    public init(url: String,title: String) {
        self.url = url;
        self.title = title;
    }
    
    
//    public init(dictionary: Dictionary<String,String>) {
//        url = dictionary["url"]
//        title = dictionary["title"]
//    }
    
}

extension Link {
    
    static func modelsFromDictionaryArray(array:Array<Link>) -> [Link]
    {
        var links:[Link] = []
        for item in array
        {
       //     links.append(Link(dictionary: item as! Dictionary<String,String>))
        }
        return links
    }
    
}

extension Link {
    
    func dictionaryRepresentation() -> Dictionary<String,String> {
        
        var dictionary = Dictionary<String,String>();
        
        dictionary["url"] = self.url;
        dictionary["title"] = self.title
        
        return dictionary
    }

}
    


