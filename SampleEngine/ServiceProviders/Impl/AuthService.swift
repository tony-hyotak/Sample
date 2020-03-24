//
//  AuthService.swift
//  SampleEngine
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import Foundation
import RxSwift

class AuthService: AccountServiceProvider {
    private let repository: AuthRepositoryProtocol
    
    var accountEventSubject = PublishSubject<AccountEvent>()

    func signIn(id: String, pw: String) ->
        Observable<Result<String, EngineError>> {
            
//        self.repository.signIn()
            
        if id.isEmpty {
            return Observable.just(.failure(.loginError(.invalidId)))
        }
        self.accountEventSubject.onNext(.signIn(id))
        return Observable.just(.success(id))
    }
    
    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
}
