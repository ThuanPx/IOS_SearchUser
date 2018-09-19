//
//  APIService.swift
//  DemoRxSwift
//
//  Created by phan.xuan.thuan on 8/28/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper
import Alamofire

private struct Constant {
    struct APIKey {
        static let q = "q"
    }
}

enum UserAPI: URLRequestConvertible,APIRequestProtocol{
    
    case searchUser(q: String)
    
    var method: HTTPMethod{
        switch self {
        case .searchUser:
            return .get
        }
    }
    
    var path: String{
       return "search/users"
    }
    
    var header: Parameters?{
        return nil
    }
  
    var params: Parameters?{
        switch self {
        case .searchUser(let q):
            return [Constant.APIKey.q: q]
        }
    }
    
    var body: Parameters?{
      return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        return self.createURLRequest
    }
}

extension API{
    class func searchUser(q: String) -> Observable<[User]>{
        let request  = UserAPI.searchUser(q: q)
        return API.request(request).flatMap({ (json) -> Observable<[User]> in
            guard let data = json["items"] as? [[String:Any]] else {
                return Observable.error(APIError.parserJsonError)
            }
            let list = Mapper<User>().mapArray(JSONArray:data)
            print(list)
            return Observable.just(list)
        })
    }
    
}

