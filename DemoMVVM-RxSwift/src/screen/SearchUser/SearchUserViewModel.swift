//
//  SearchUserView.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/11/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchUserViewModel: BaseViewModel {
    
    private let navigator: SearchUserNavigator
    private var users = Variable<[User]>([])
    
    init(navigator: SearchUserNavigator) {
        self.navigator = navigator
    }
}

extension SearchUserViewModel {
 
    var itemUsers: Int {
        return users.value.count
    }
    
    func item(at index:Int)-> User{
        return users.value[index]
    }
    
    struct Input {
        let keyWord: Driver<String?>
        let selected: Driver<Int>
    }
    
    struct Output {
        let users: Driver<Void>
    }
    
    func transform(_ input: Input, with bag: DisposeBag) -> Output {
      let searchUserSuccess =  input.keyWord.filter{ !$0.isWhiteSpaceOrEmpty()}
            .flatMap{[unowned self] key -> Driver<[User]> in
            return API.searchUser(q: key!)
                .trackError(self.errorTracker)
                .trackActivity(self.activityIndicator)
                .asDriverOnErrorJustComplete()
            }.do(onNext:{[unowned self] (items) in
                self.users.value = items
            }).mapToVoid()
        
         input.selected.drive(onNext:{
            [weak self] index in
            guard let `self` = self else { return }
            let user = self.item(at: index)
            self.navigator.moveToDetailUser(user: user)
        }).disposed(by: bag)
        return Output(users: searchUserSuccess)
    }
}

