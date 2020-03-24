//
//  SecondViewModel.swift
//  Sample
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import Foundation
import RxSwift
import SampleEngine

class SecondViewModel {
    private let disposeBag = DisposeBag()
    private var accountService: AccountServiceProvider
    
    init(account: AccountServiceProvider) {
        self.accountService = account
        bind()
    }
    
}

extension SecondViewModel {
    
    func bind() {
        self.accountService.accountEventSubject
            .subscribe(onNext: { event in
                switch event {
                case .signIn(_):
                    break
                }
            }).disposed(by: self.disposeBag)
    }
    
}
