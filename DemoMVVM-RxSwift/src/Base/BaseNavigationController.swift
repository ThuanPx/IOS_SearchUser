//
//  BaseNavigationController.swift
//  DemoMVVM-RxSwift
//
//  Created by Thuan on 9/13/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .navigationBar
        navigationBar.tintColor = .grayText
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.blackText]
        navigationBar.titleTextAttributes = textAttributes
    }
}
