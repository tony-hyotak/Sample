//
//  ChatService.swift
//  SampleEngine
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class ChatService: ChatServiceProvider {
    
    var chatListEventSubject = PublishSubject<ChatListEvent>()
    var chatRoomListRelay = BehaviorRelay<[DataModel.ChatRoom]>(value: [])
    
    private var conversationServiceDataSource = [Int: ConversationService]()
    
    func conversationService(_ conversationId: Int) -> ConversationServiceProvider {
        return conversationServiceDataSource[conversationId]!
    }

}
