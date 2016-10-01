//
//  Model.swift
//  HipChatJsonify
//
//  Created by Farahani, Reza(AWF) on 28/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

protocol Model{
}
protocol EmoticonMentionModel: Model {
    var name: String {get set}
    init?(name: String)
}