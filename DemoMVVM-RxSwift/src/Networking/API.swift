//
//  API.swift
//  DemoRxSwift
//
//  Created by phan.xuan.thuan on 8/28/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift
import RxCocoa
import RxAlamofire


class API {
    private static var configuration: URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        return config
    }
    
    private static var uploadConfiguration: URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        return config
    }
    
    private static var sessionManager = SessionManager(configuration: configuration)
    
    private static var updateSessionManager = SessionManager(configuration: uploadConfiguration)
    
    /// This will call the request to endpoint.
    ///
    /// - Parameter request: URLRequestConvertible which contain information about the request
    /// - Returns: the data [String: Any] on the key "data" will return when meet those conditions:
    ///             - valid statusCode
    
    public class func request(_ request: URLRequestConvertible) -> Observable<[String: Any]> {
        return sessionManager.rx
            .request(urlRequest: request)
            .responseJSON()
            .flatMap({ responseJson -> Observable<[String: Any]> in
                guard let response = responseJson.response,
                    let data = responseJson.result.value else {
                        // TODO: Implement Error
                        fatalError()
                }
                if response.statusCode >= 200 && response.statusCode < 300 {
                    guard let json = data as? [String: Any] else {
                        fatalError()
                    }
                    return Observable.just(json)
                } else {
                    fatalError()
                }
            })
    }
//    class func request(_ request: URLRequestConvertible) -> Observable<[String: Any]> {
//        return sessionManager.rx.request(urlRequest: request)
//            .responseJSON()
//            .flatMap({ (responseJSON) -> Observable<[String: Any]> in
//                guard let response = responseJSON.response,
//                    let data = responseJSON.result.value else {
//                        return Observable.error(APIError.parserJsonError)
//                }
//                // Validate status code
//                if response.statusCode >= 200 && response.statusCode < 300 {
//                    // Validate date
//                    guard let json = data as? [String: Any],
//                        let baseResponse = Mapper<APIResponseModel>().map(JSON: json) else {
//                            return Observable.error(APIError.parserJsonError)
//                    }
//                    return Observable.just(baseResponse.data ?? [:])
//                } else {
//                    return Observable.error(APIError.expiredToken)
//                }
//            }).catchError({ (error) -> Observable<[String: Any]> in
//                // use catchError to handle URLError.Code.notConnectedToInternet case
//                if let apiError = error as? APIError {
//                    return Observable.error(apiError)
//                } else if (error as NSError).code == -1001 {
//                    return Observable.error(APIError.timeout)
//                } else {
//                    return Observable.error(APIError.networkError)
//                }
//            })
//    }
    
}
