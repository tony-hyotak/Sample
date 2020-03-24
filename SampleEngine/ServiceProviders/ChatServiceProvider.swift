//
//  ChatServiceProvider.swift
//  SampleEngine
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

public enum ChatListEvent {
    case removed(DataModel.ChatRoom)
    case favorite(DataModel.ChatRoom)
    case titleChanged(DataModel.ChatRoom)
}

public protocol ChatServiceProvider {
    
    var chatListEventSubject: PublishSubject<ChatListEvent> { get }
    var chatRoomListRelay: BehaviorRelay<[DataModel.ChatRoom]> { get }
    
    func conversationService(_ conversationId: Int) -> ConversationServiceProvider
    
}
