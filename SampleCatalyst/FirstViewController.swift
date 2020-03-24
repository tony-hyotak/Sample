//
//  FirstViewController.swift
//  SampleCatalyst
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    private var viewModel: FirstViewModel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let account = AppDelegate.shared.engine.accountService()
        viewModel = FirstViewModel(account: account)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

