//
//  NumberFactRepositoryInjectable.swift
//  NumberFacts
//
//  Created by dvt on 2017/11/09.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation

protocol NumberFactRepositoryInjectable {
    var numberFact: NumberFactRepository {get}
}

extension NumberFactRepositoryInjectable {
    var numberFact: NumberFactRepository {
        return InjectionMapper.resolve()
    }
}
