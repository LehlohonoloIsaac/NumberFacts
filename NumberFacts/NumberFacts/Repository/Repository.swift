//
//  Repository.swift
//  NumberFacts
//
//  Created by dvt on 2017/11/09.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation
import Alamofire

protocol NumberFactRepository {
    func fetchFactForNumber(number input: Int, numberFactFetched: @escaping (String?) -> Void)
    func fetchFactForRandomNumber(numberFactFetched: @escaping (String?) -> Void)
}

class NumberFactRepositoryImplementation : NumberFactRepository {
    func fetchFactForRandomNumber(numberFactFetched: @escaping (String?) -> Void) {
        let endPoint = "\(URL_BASE)\(RANDOM_NUMBER)"
        requestFactFromApi(from: endPoint, numberFactFetched: numberFactFetched)
    }
    
    func fetchFactForNumber(number input: Int, numberFactFetched: @escaping (String?) -> Void) {
        let endPoint = "\(URL_BASE)\(input)"
        requestFactFromApi(from: endPoint, numberFactFetched: numberFactFetched)
    }
    
    func requestFactFromApi(from endPoint: String,numberFactFetched: @escaping (String?) -> Void){
        Alamofire.request(endPoint).responseString(completionHandler: {
            (_ response: DataResponse<String>?) in
            if let response = response {
                let responseString  = String(describing: response)
                numberFactFetched(responseString)
            }
        })
    }
}

