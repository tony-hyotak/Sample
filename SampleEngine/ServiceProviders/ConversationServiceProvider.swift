//
//  ConversationServiceProvider.swift
//  SampleEngine
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

public enum ConversationEvent {
    case receiveMessage(String)
    case leftMember(DataModel.User)
}

public protocol ConversationServiceProvider {
    
    var conversationEventSubject: PublishSubject<ConversationEvent> { get }
    
    func sendMessage(text: String) -> Observable<Result<DataModel.Message, EngineError>>
    
}
