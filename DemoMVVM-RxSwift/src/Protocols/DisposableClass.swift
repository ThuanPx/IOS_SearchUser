//
//  DisposableProtocol.swift
//  SpecialSymbols
//
//  Created by dang.nguyen.vu on 6/18/18.
//  Copyright © 2018 Gungnir. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol DisposableClass: class {
    var bag: DisposeBag {get set}
}

extension Disposable {
    func disposed(by disposableClass: DisposableClass) {
        disposed(by: disposableClass.bag)
    }
}

extension SharedSequenceConvertibleType where Self.SharingStrategy == RxCocoa.DriverSharingStrategy {
    
    func disposed(by disposableClass: DisposableClass) {
        drive().disposed(by: disposableClass.bag)
    }
}

extension Observable {
    func disposed(by disposableClass: DisposableClass) {
        subscribe().disposed(by: disposableClass.bag)
    }
}
