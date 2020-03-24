//
//  AccountServiceProvider.swift
//  SampleEngine
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import Foundation
import RxSwift

public enum AccountEvent {
    case signIn(String)
}

public protocol AccountServiceProvider {
    
    var accountEventSubject: PublishSubject<AccountEvent> { get }
    
    func signIn(id: String, pw: String) -> Observable<Result<String, EngineError>>
    
}
