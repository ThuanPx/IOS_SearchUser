//
//  NSObject.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/12/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    var className: String {
        return String(describing: type(of: self))
    }
}
