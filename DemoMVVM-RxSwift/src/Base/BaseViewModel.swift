//
//  BaseViewModel.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/11/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel: NSObject {
    var activityIndicator = ActivityIndicator()
    var errorTracker = ErrorTracker()
}
