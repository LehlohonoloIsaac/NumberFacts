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
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNumberViewModel = UserNumberViewModel()
        self.userNumberViewModel.delegate = self
    }
    
    @IBAction func onGetFactPressed(_ sender: UIButton) {
        let number: Int = Int(userInput.text!)!
        self.userNumberViewModel.generateFactFor(number)
    }
    
    @IBAction func onGenerateFactPressed(_ sender: UIButton) {
        self.userNumberViewModel.generateRandomFact()
    }
}


extension ViewController: NumberFactDelegate {
    func doneFetchingNumberFact() {
        factLabel.text = self.userNumberViewModel.showDisplayableFact
    }
}
