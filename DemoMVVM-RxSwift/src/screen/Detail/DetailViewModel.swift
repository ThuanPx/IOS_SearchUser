//
//  DetailViewModel.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/17/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class DetailViewModel: BaseViewModel {
    private let navigator: DetailNavigator
    private let userVariable: Variable<User>
    
    init(navigator: DetailNavigator, user: User) {
        self.navigator = navigator
        self.userVariable = Variable(user)
    }
}

extension DetailViewModel {
    
    struct Input {
    }
    
    struct Output{
        let user : Driver<User>
    }
    
    func transform(_ input :Input, with bag: DisposeBag) -> Output{
        let user = userVariable.asDriver()
        return Output(user: user)
    }
}
