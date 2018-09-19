//
//  APIRequestProtocol.swift
//  DemoRxSwift
//
//  Created by phan.xuan.thuan on 8/28/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Alamofire
import UIKit

private struct Constant{
     static let URL = "https://api.github.com/"
}

protocol APIRequestProtocol {
    var method: HTTPMethod { get }
    var path: String { get }
    var header: Parameters? { get }
    var params: Parameters? { get }
    var body: Parameters? { get }
    var createURLRequest: URLRequest { get }
}

extension APIRequestProtocol {
//    var defaultHeader: Parameters {
//        return nil
//    }
    
    var createURLRequest: URLRequest {
        let url = URL(string: Constant.URL + path)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setHeaders(header)
        urlRequest.setParams(params)
        urlRequest.setBody(body)
     
        return urlRequest
    }
}


