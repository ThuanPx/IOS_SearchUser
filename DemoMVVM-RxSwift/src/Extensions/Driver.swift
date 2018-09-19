//
//  Driver+Extension.swift
//  Eutopia
//
//  Created by dang.nguyen.vu on 7/4/18.
//  Copyright © 2018 Gungnir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Driver {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
    
    /**
     Invokes an action for each event in the observable sequence,
     and propagates all observer messages through the result sequence.
     
     - parameter variable: Target variable for sequence elements.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    func `do`(_ variable: Variable<E>) -> SharedSequence<SharingStrategy, E> {
        return `do`(onNext: { e in
            variable.value = e
        })
    }
    
    /**
     Invokes an action for each event in the observable sequence,
     and propagates all observer messages through the result sequence.
     
     - parameter variable: Target variable for sequence elements.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    func `do`(_ variable: Variable<E?>) -> SharedSequence<SharingStrategy, E> {
        return `do`(onNext: { e in
            variable.value = e
        })
    }
    
    /**
     Invokes an action for each event in the observable sequence,
     and propagates all observer messages through the result sequence.
     
     - parameter variable: Target variable for sequence elements.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    func `do`(_ publishSubject: PublishSubject<E>) -> SharedSequence<SharingStrategy, E> {
        return `do`(onNext: { e in
            publishSubject.onNext(e)
        })
    }
    
    /**
     Invokes an action for each event in the observable sequence,
     and propagates all observer messages through the result sequence.
     
     - parameter variable: Target variable for sequence elements.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    func `do`(_ publishSubject: PublishSubject<E?>) -> SharedSequence<SharingStrategy, E> {
        return `do`(onNext: { e in
            publishSubject.onNext(e)
        })
    }
}
