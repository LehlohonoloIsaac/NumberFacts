//
//  Repository.swift
//  NumberFacts
//
//  Created by dvt on 2017/11/09.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation


protocol NumberFactRepository {
    func fetchFactFor(_ number: Int) -> String
}

class NumberFactRepositoryImplementation : NumberFactRepository {
    
    func fetchFactFor(_ number: Int) -> String {
        return "\(number) is a very big number"
    }
    
}

