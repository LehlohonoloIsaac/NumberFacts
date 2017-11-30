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
    func fetchFactForRandomNumber(_ endpoint: EndPoint, numberFactFetched: @escaping (String?) -> Void)
}

class NumberFactRepositoryImplementation: NumberFactRepository {
    func fetchFactForRandomNumber(_ endpoint: EndPoint, numberFactFetched: @escaping (String?) -> Void) {
        var endPoint = "\(urlBase)\(randomNumber)"
        switch endpoint {
        case .random:
            endPoint = "\(urlBase)\(randomNumber)"
        case .randomDate:
            endPoint = "\(urlBase)\(randomDate)"
        case .randomMath:
            endPoint = "\(urlBase)\(randomMath)"
        case .randomYear:
            endPoint = "\(urlBase)\(randomYear)"
        default:
            endPoint = "\(urlBase)\(randomNumber)"
        }
        print(endPoint)
        requestFactFromApi(from: endPoint, numberFactFetched: numberFactFetched)
    }
    
    func fetchFactForNumber(number input: Int, numberFactFetched: @escaping (String?) -> Void) {
        let endPoint = "\(urlBase)\(input)"
        requestFactFromApi(from: endPoint, numberFactFetched: numberFactFetched)
    }
    
    func requestFactFromApi(from endPoint: String, numberFactFetched: @escaping (String?) -> Void) {
        Alamofire.request(endPoint).responseString(completionHandler: { (_ response: DataResponse<String>?) in
            if let response = response {
                let responseString  = String(describing: response)
                numberFactFetched(responseString)
            }
        })
    }
}
