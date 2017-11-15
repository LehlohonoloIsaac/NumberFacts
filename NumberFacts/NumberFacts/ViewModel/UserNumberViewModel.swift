//
//  UserNumberViewModel.swift
//  NumberFacts
//
//  Created by dvt on 2017/11/09.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation

protocol NumberFactDelegate {
    func doneFetchingNumberFact()
}

class UserNumberViewModel: NumberFactRepositoryInjectable{

    private var _userNumber: Int!
    private var _fact: String?
    var delegate: NumberFactDelegate!
    
    init() {
        self.numberFact.fetchFactForRandomNumber(.random,numberFactFetched: {fact in
            self._fact = fact
            self.delegate.doneFetchingNumberFact()
        })
    }
    
    func generateRandomFact(_ endPoint: EndPoint){
        self.numberFact.fetchFactForRandomNumber(endPoint,numberFactFetched: {fact in
            self._fact = fact
            self.delegate.doneFetchingNumberFact()
        })
    }
    
    func generateFactFor(_ endPoint: EndPoint,_ number: Int){
        self.numberFact.fetchFactForNumber(endPoint, number: number, numberFactFetched: {fact in 
            self._fact = fact
            self.delegate.doneFetchingNumberFact()
        })
    }
    
    func generateFactFor(_ endPoint: EndPoint, _ date: String){
        self.numberFact.fetchFactForDate(endPoint, date: date, numberFactFetched: {fact in
            self._fact = fact
            self.delegate.doneFetchingNumberFact()
        })
    }

    var showDisplayableFact: String {
        let fact = self._fact?.replacingOccurrences(of: "SUCCESS: ", with: "")
        return fact!
    }
}


