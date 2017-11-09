//
//  UserNumberViewModel.swift
//  NumberFacts
//
//  Created by dvt on 2017/11/09.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation

struct UserNumberViewModel: NumberFactRepositoryInjectable{

    private var userNumber: Int!
    private var fact: String?
    
    init(_ number: Int) {
        self.userNumber = number
        self.fact = self.numberFact.fetchFactFor(self.userNumber)
    }
    
    var showDisplayableFact: String {
        return self.fact!
    }
    
}
