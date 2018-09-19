//
//  ControllerProtocol.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/11/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit

protocol ViewModelViewController: class {
    associatedtype ViewModel: BaseViewModel
    var viewModel: ViewModel! {get set}
}

extension ViewModelViewController where Self: UIViewController {
    
    static func createWith(_ viewModel: ViewModel) -> Self {
        let controller = Self(nibName: self.className, bundle: nil)
        controller.viewModel = viewModel
        return controller
    }
}
