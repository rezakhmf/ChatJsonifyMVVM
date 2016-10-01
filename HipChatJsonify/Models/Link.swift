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
}

public struct Link: LinkModel,JSONSerializable{
   
    var url: String
    var title: String
    
    public init(url: String,title: String) {
        self.url = url;
        self.title = title;
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
    


