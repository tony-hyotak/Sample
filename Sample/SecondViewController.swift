//
//  SecondViewController.swift
//  Sample
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    private var viewModel: SecondViewModel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let account = AppDelegate.shared.engine.accountService()
        viewModel = SecondViewModel(account: account)
        
        bind(viewModel: viewModel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


extension SecondViewController {
    
    func bind(viewModel: SecondViewModel) {
        
    }
    
}
