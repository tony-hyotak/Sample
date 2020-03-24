//
//  FirstViewModel.swift
//  Sample
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import SampleEngine

class FirstViewModel {
    private let disposeBag = DisposeBag()
    private var accountService: AccountServiceProvider
    
    private let loginIdRelay = BehaviorRelay<String>(value: "")
    
    init(account: AccountServiceProvider) {
        self.accountService = account
        bind()
    }
    
}

extension FirstViewModel {
    
    func bind() {
        self.accountService.accountEventSubject
            .subscribe(onNext: { [weak self] event in
                guard let self = self else { return }
                switch event {
                case .signIn(let id):
                    self.loginIdRelay.accept(id)
                }
            }).disposed(by: self.disposeBag)
    }
    
}

extension FirstViewModel {
    
    var loginID: Observable<String> {
        return self.loginIdRelay.map { $0 }
    }
    
}
