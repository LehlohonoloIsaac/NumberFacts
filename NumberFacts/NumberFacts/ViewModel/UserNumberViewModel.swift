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
    
    init(_ number: Int) {
        self._userNumber = number
        self.numberFact.fetchFactFor(self._userNumber, numberFactFetched: {fact in
            self._fact = fact
            self.delegate.doneFetchingNumberFact()
        })
    }

    var showDisplayableFact: String {
        return self._fact!
    }
}


