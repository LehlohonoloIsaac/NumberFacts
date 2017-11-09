//
//  InjectionMapper.swift
//  NumberFacts
//
//  Created by dvt on 2017/11/09.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation

class InjectionMapper {
    
    private static var mapper: NumberFactRepository = NumberFactRepositoryImplementation()
    
    static func resolve() -> NumberFactRepository {
        return mapper
    }
    
    static func inject(_ mapper: NumberFactRepository){
        self.mapper = mapper
    }
    
    static func reset() {
        self.mapper = NumberFactRepositoryImplementation()
    }
}
