//
//  ConversationService.swift
//  SampleEngine
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class ConversationService: ConversationServiceProvider {
    
    var conversationEventSubject = PublishSubject<ConversationEvent>()
    
    func sendMessage(text: String) -> Observable<Result<DataModel.Message, EngineError>> {
        let message = DataModel.Message(messageId: 1, text: text)
        return Observable.just(.success(message))
    }
    
}

extension ConversationService {
    
}
