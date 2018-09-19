//
//  BaseViewController.swift
//
//  Created by Dang Nguyen Vu on 11/30/17.
//  Copyright © 2017 Gungnir. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController, DisposableClass {
    
    var bag = DisposeBag()
    
    var navTitle: String? {
        didSet {
            navigationItem.title = navTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        setupUI()
        setupObservable()
        bindViewModel()
        setupBackButton(isShow: true)
    }
    
    func setupBackButton(isShow: Bool) {
        if isShow {
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backButton
        } else {
            navigationItem.leftBarButtonItem = nil
            navigationItem.setHidesBackButton(true, animated: true)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("+++++++++++++++++++++++\(String(describing: self))")
    }
    
    internal func setupUI() { }
    
    internal func setupObservable() { }
    
    internal func bindViewModel() { }
}

