//
//  DataModel.swift
//  SampleEngine
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import Foundation

public enum DataModel { }

extension DataModel {
    
    public struct ChatRoom {
        public var roomId: Int
        public var title: String
    }
    
}

extension DataModel {
    
    public struct User {
        public var userId: Int
        public var name: String
    }
    
}

extension DataModel {
    
    public struct Message {
        public var messageId: Int
        public var text: String
    }
    
}
