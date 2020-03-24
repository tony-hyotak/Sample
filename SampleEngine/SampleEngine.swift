//
//  SampleEngine.swift
//  SampleEngine
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import Foundation

public enum EngineError: Error {
    case loginError(LoginFailureReason)
    
    public enum LoginFailureReason {
        case invalidId
        case invalidPwd
    }
}

public protocol SampleEngineProtocol {
    func initialize()
    
    func accountService() -> AccountServiceProvider
    func memberService() -> MemberServiceProvider
    func todoRepository() -> TodoRepositoryProtocol
}

public class SampleEngine: SampleEngineProtocol {

    public static let `default` = SampleEngine()
    private var repository: Repository!
    private var auth: AuthService!
    private var member: MemberService!
    
    public func initialize() {
        self.repository = Repository()
        self.auth = AuthService(repository: self.repository)
        
    }

    public func accountService() -> AccountServiceProvider {
        return self.auth
    }

    public func memberService() -> MemberServiceProvider {
        return self.member
    }

    public func todoRepository() -> TodoRepositoryProtocol {
        return self.repository
    }
}
