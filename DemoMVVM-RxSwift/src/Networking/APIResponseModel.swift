//
//  APIResponseModel.swift
//  DemoRxSwift
//
//  Created by phan.xuan.thuan on 8/28/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import ObjectMapper

struct APIResponseModel {
    var data: [String: Any]?
    var errorCode: String?
    var errorMessage: String?
}

extension APIResponseModel: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        data <- map["items"]
        errorCode <- map["error_code"]
        errorMessage <- map["error_message"]
    }
}

