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
    private var endPoint: EndPoint = .random
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headingLabel.text = "Enter your favourite number to get an interesting fact about it"
        self.userNumberViewModel = UserNumberViewModel()
        self.userNumberViewModel.delegate = self
        self.populateOptionButtonsArray()
        self.updateTab(button: triviaButton)
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
    
    fileprivate func generateFact() {
        let num = Int(userInput.text!)
        if num != nil{
            getFactButton.isEnabled = false
            generateRandomFactButton.isEnabled = false
            let number: Int = Int(userInput.text!)!
            self.userNumberViewModel.generateFactFor(endPoint,number)
        }
        else
        {
            self.showAlert(withMessage: "Make sure the input text is a valid number")
        }
    }
    
    @IBAction func onGetFactPressed(_ sender: UIButton) {
        if !(userInput.text?.isEmpty)! {
            if endPoint == .date {
                if (userInput.text?.contains("/"))!{
                   let input = userInput.text
                    self.userNumberViewModel.generateFactFor(endPoint, input!)
                }else{
                    self.generateFact()
                }
            }else {
                self.generateFact()
            }
        } else {
            self.showAlert(withMessage: "Make sure the input text is not empty and is in a correct format")
        }
    }
    
    
     func updateEndPointTobeARandomEndPoint() {
        switch endPoint {
        case .trivia:
            self.endPoint = .random
            break
        case .math:
            self.endPoint = .randomMath
            break
        case .date:
            self.endPoint = .randomDate
            break
        case .year:
            self.endPoint = .randomYear
            break
        default:
            break
        }
    }
    
    @IBAction func onGenerateFactPressed(_ sender: UIButton) {
        getFactButton.isEnabled = false
        generateRandomFactButton.isEnabled = false
        updateEndPointTobeARandomEndPoint()
        self.userNumberViewModel.generateRandomFact(endPoint)
    }
    
    fileprivate func updateTab(button tabButton: UIButton) {
        for button in optionButtons {
            button.backgroundColor =  UIColor.darkGray
        }
        tabButton.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func onTriviaButtonPressed(_ sender: UIButton) {
        headingLabel.text = "Enter your favourite number to get an interesting fact about it"
        updateTab(button: triviaButton)
        self.endPoint = .trivia
    }
    
    @IBAction func onMathButtonPressed(_ sender: UIButton) {
        headingLabel.text = "Enter your favourite number to get an interesting maths fact about it"
        updateTab(button: mathButton)
        self.endPoint = .math
    }
    
    @IBAction func onDateButtonPressed(_ sender: Any) {
          headingLabel.text = "Enter your favourite date to get an interesting fact about it"
          updateTab(button: dateButton)
            self.endPoint = .date
    }
    
    @IBAction func onYearButtonPressed(_ sender: Any) {
          headingLabel.text = "Enter your favourite year to get an interesting fact about it"
            updateTab(button: yearButton)
        self.endPoint = .year
    }
    
}


extension ViewController: NumberFactDelegate {
    func doneFetchingNumberFact() {
        factLabel.text = self.userNumberViewModel.showDisplayableFact
        getFactButton.isEnabled = true
        generateRandomFactButton.isEnabled = true
    }
}

