//
//  Number.swift
//  NumberFacts
//
//  Created by dvt on 2017/11/09.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation

struct UserNumber {
    
    private var _number: Int
    
    var number: Int {
        if _number >= 0 {
            return _number
        }else {
            return -1
        }
    }
    
    init(_ number: Int) {
        self._number = number
    }
}
