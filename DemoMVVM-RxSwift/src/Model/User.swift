//
//  User.swift
//  DemoMVVM-RxSwift
//
//  Created by Thuan on 9/13/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import ObjectMapper

struct User{
    
    var login: String?
    var imageUrl:String?
    
    init(login:String?, imageUrl:String?){
        self.login = login
        self.imageUrl = imageUrl
    }
    
}
extension User: Mappable{
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        login <- map["login"]
        imageUrl <- map["avatar_url"]
    }
}

