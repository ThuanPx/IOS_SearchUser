//
//  SearchUserNavigation.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/11/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

 protocol SearchUserNavigator {
    func moveToDetailUser(user: User)
    func moveToSearchUser()
}

class DefaultSearchUserNavigator: SearchUserNavigator {
    private let navigatorController : UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigatorController = navigation
    }
    
    func moveToDetailUser(user: User) {
        let navigator = DefaultDetailNavigator(navigation: navigatorController)
        let viewModel = DetailViewModel(navigator: navigator, user: user)
        let controller = DetailController.createWith(viewModel)
        navigatorController.pushViewController(controller, animated: true)
    }
    
    func moveToSearchUser() {
        let viewModel = SearchUserViewModel(navigator : self)
        let controller = SearchUserController.createWith(viewModel)
        navigatorController.viewControllers = [controller]
    }
}
