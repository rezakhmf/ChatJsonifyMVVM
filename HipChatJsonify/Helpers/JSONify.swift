//
//  JSONify.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 29/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

protocol JSONRepresentable {
    var JSONRepresentation: AnyObject { get }
}

protocol JSONSerializable: 	JSONRepresentable {
}

extension JSONSerializable {
    var JSONRepresentation: AnyObject {
        var representation = [String: AnyObject]()
        
        for case let (label?, value) in Mirror(reflecting: self).children {
            switch value {
            case let value as JSONRepresentable:
                representation[label] = value.JSONRepresentation
                
            case let value as NSObject:
                representation[label] = value
                
            default:
                break
            }
        }
        
        return representation
    }
}

extension JSONSerializable {
    func toJSON() -> String? {
        let representation = JSONRepresentation
        
        guard NSJSONSerialization.isValidJSONObject(representation) else {
            return nil
        }
        
        do {
            let data = try NSJSONSerialization.dataWithJSONObject(representation, options: [])
            return String(data: data, encoding: NSUTF8StringEncoding)
        } catch {
            return nil
        }
    }
}
