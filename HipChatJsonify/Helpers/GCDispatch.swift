//
//  GCDispatch.swift
//  HipChatJsonify
//
//  Created by Reza Farahani on 11/09/2016.
//  Copyright © 2016 Reza Farahani. All rights reserved.
//

import Foundation

public struct GCDispatch {
    
    public typealias Block = () -> ();
    
    }

extension GCDispatch {
    
    public static func asyncGroup(group: dispatch_group_t = dispatch_group_create(),queue: dispatch_queue_t = dispatch_queue_create("dispatch.async", DISPATCH_QUEUE_CONCURRENT), block: Block) {
        dispatch_group_enter(group);
        dispatch_group_async(group,queue,block)
        dispatch_group_leave(group);
        
    }
}

extension GCDispatch {
    
    public static func async(queue: dispatch_queue_t = dispatch_queue_create("dispatch.async", DISPATCH_QUEUE_CONCURRENT), delay: Double = 0.0, block: Block) {
        let after = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(after, queue, block)
    }
}

