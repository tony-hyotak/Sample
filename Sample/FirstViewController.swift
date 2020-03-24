//
//  FirstViewController.swift
//  Sample
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import UIKit
import RxSwift

class FirstViewController: UIViewController {

    private var disposeBag = DisposeBag()
    private var viewModel: FirstViewModel!
    private var loginIdLabel = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let account = AppDelegate.shared.engine.accountService()
        viewModel = FirstViewModel(account: account)
        
        bind(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.subviews.forEach { view in
            view.removeFromSuperview()
        }
        
        loginIdLabel.translatesAutoresizingMaskIntoConstraints  = false
        self.view.addSubview(loginIdLabel)
        NSLayoutConstraint.activate([
            self.loginIdLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.loginIdLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        ])
        
        self.view.addSubview(self.loginIdLabel)
    }

}

extension FirstViewController {
    
    func bind(viewModel: FirstViewModel) {
        viewModel.loginID
            .skip(1)
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] id in
                self?.loginIdLabel.text = id
            }).disposed(by: self.disposeBag)
    }
    
}
