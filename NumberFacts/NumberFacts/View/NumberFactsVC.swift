//
//  ViewController.swift
//  NumberFacts
//
//  Created by dvt on 2017/11/09.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var userNumberViewModel: UserNumberViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNumberViewModel = UserNumberViewModel(9)
        self.userNumberViewModel.delegate = self
    }
}


extension ViewController: NumberFactDelegate {
    func doneFetchingNumberFact() {
        print(self.userNumberViewModel.showDisplayableFact)
    }
}
