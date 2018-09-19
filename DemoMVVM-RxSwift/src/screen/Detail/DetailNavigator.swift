//
//  DetailNavigator.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/17/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

protocol DetailNavigator {

}

class DefaultDetailNavigator : DetailNavigator {
    private let navigatorController: UINavigationController
    
    init(navigation:UINavigationController) {
        navigatorController = navigation
    }
}

