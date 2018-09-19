//
//  Application.swift
//  DemoMVVM-RxSwift
//
//  Created by Thuan on 9/13/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

final class Application {
    
    static let shared = Application()
    
   private init() {
    }
    
    func configureMainScreen(in window: UIWindow){
        let navigation = BaseNavigationController()
        let notificationNavigation = DefaultSearchUserNavigator(navigation: navigation)
        navigation.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigation
        notificationNavigation.moveToSearchUser()
        
    }
    
}
