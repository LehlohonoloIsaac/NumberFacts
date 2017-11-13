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
    @IBOutlet weak var triviaButton: UIButton!
    @IBOutlet weak var mathButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var yearButton: UIButton!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var getFactButton: UIButton!
    @IBOutlet weak var factContainerView: UIView!
    @IBOutlet weak var generateRandomFactButton: UIButton!
    
    private var optionButtons = Array<UIButton>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headingLabel.text = "Enter your favourite number to get an interesting fact about it"
        self.userNumberViewModel = UserNumberViewModel()
        self.userNumberViewModel.delegate = self
        self.populateOptionButtonsArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureView()
    }
    
    func configureView(){
        getFactButton.createBorder(withRadius: 5)
        factContainerView.createBorder(withRadius: 5)
        for button in optionButtons {
            button.createBorder(withRadius: 3)
        }
    }
    
    func populateOptionButtonsArray() {
        optionButtons.append(triviaButton)
        optionButtons.append(mathButton)
        optionButtons.append(dateButton)
        optionButtons.append(yearButton)
    }
    
    func showAlert(withMessage message: String? = "Make sure the input field is not empty"){
        let alertController = UIAlertController(title: "Wrong Input", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func onGetFactPressed(_ sender: UIButton) {
        if !(userInput.text?.isEmpty)! {
            let num = Int(userInput.text!)
            if num != nil{
                getFactButton.isEnabled = false
                generateRandomFactButton.isEnabled = false
                let number: Int = Int(userInput.text!)!
                self.userNumberViewModel.generateFactFor(number)
            }else{
                self.showAlert(withMessage: "Make sure the input text is a valid number")
            }
        } else {
            self.showAlert(withMessage: "Make sure the input text is not empty and is in a correct format")
        }
    }
    
    @IBAction func onGenerateFactPressed(_ sender: UIButton) {
        getFactButton.isEnabled = false
        generateRandomFactButton.isEnabled = false
        self.userNumberViewModel.generateRandomFact()
    }
    
    @IBAction func onTriviaButtonPressed(_ sender: UIButton) {
        headingLabel.text = "Enter your favourite number to get an interesting fact about it"
        for button in optionButtons {
            button.backgroundColor =  UIColor.darkGray
        }
        triviaButton.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func onMathButtonPressed(_ sender: UIButton) {
        headingLabel.text = "Enter your favourite number to get an interesting maths fact about it"
        for button in optionButtons {
            button.backgroundColor =  UIColor.darkGray
        }
        mathButton.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func onDateButtonPressed(_ sender: Any) {
          headingLabel.text = "Enter your favourite date to get an interesting fact about it"
        for button in optionButtons {
            button.backgroundColor =  UIColor.darkGray
        }
        dateButton.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func onYearButtonPressed(_ sender: Any) {
          headingLabel.text = "Enter your favourite year to get an interesting fact about it"
        for button in optionButtons {
            button.backgroundColor =  UIColor.darkGray
        }
        yearButton.backgroundColor = UIColor.lightGray
    }
    
}


extension ViewController: NumberFactDelegate {
    func doneFetchingNumberFact() {
        factLabel.text = self.userNumberViewModel.showDisplayableFact
        getFactButton.isEnabled = true
        generateRandomFactButton.isEnabled = true
    }
}

