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
    func fetchFactForNumber(_ endpoint: EndPoint,number input: Int, numberFactFetched: @escaping (String?) -> Void)
    func fetchFactForDate(_ endpoint: EndPoint,number input: Int, numberFactFetched: @escaping (String?) -> Void)
    func fetchFactForRandomNumber(_ endpoint: EndPoint,numberFactFetched: @escaping (String?) -> Void)
}

class NumberFactRepositoryImplementation : NumberFactRepository {
    func fetchFactForRandomNumber(_ endpoint: EndPoint,numberFactFetched: @escaping (String?) -> Void) {
        var endPoint = "\(URL_BASE)\(RANDOM_NUMBER)"
        switch endpoint {
        case .random:
            endPoint = "\(URL_BASE)\(RANDOM_NUMBER)"
            break
        case .randomDate:
            endPoint = "\(URL_BASE)\(RANDOM_DATE)"
            break
        case .randomMath:
            endPoint = "\(URL_BASE)\(RANDOM_MATH)"
            break
        case .randomYear:
            endPoint = "\(URL_BASE)\(RANDOM_YEAR)"
            break
        default:
            endPoint = "\(URL_BASE)\(RANDOM_NUMBER)"
            break
        }
        requestFactFromApi(from: endPoint, numberFactFetched: numberFactFetched)
    }
    
    func fetchFactForNumber(_ endpoint: EndPoint, number input: Int, numberFactFetched: @escaping (String?) -> Void) {
        var endPoint = "\(URL_BASE)\(input)"
        switch endpoint {
        case .trivia:
            endPoint = "\(URL_BASE)\(input)"
            break
        case .year:
            let yearText = "/year/"
            endPoint = "\(URL_BASE)\(input)\(yearText)"
            break
        case .math:
            let mathText = "/math/"
            endPoint = "\(URL_BASE)\(input)\(mathText)"
        default:
            endPoint = "\(URL_BASE)\(input)"
            break
        }
        requestFactFromApi(from: endPoint, numberFactFetched: numberFactFetched)
    }
    
    func fetchFactForDate(_ endpoint: EndPoint, number input: Int, numberFactFetched: @escaping (String?) -> Void) {
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

