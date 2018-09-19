//
//  DetailController.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/17/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

class DetailController : BaseViewController, ViewModelViewController {
    
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    private weak var backButton: UIBarButtonItem!
    
    var viewModel: DetailViewModel!
    
    override func setupUI() {
        navTitle = "Detail"
        backButton = UIBarButtonItem(image: UIImage(named: "back_button"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }
    
    override func bindViewModel() {
        let input = ViewModel.Input()
        let output = viewModel.transform(input, with: bag)
        output.user.drive(onNext:{
               [weak self] user in
            self?.bind(user)
        }).disposed(by: self)
    }
    
    private func bind(_ user:User){
        if let url = user.imageUrl {
            ivAvatar.kf.setImage(with: URL(string: url))
        }
        lblName.text = user.login
    }
    
}
