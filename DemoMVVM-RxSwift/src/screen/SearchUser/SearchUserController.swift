//
//  SearchUserController.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/11/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import UIKit

class SearchUserController : BaseViewController, ViewModelViewController{
    
    @IBOutlet private weak var tableUser: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    // MARK: View Model
    var viewModel: SearchUserViewModel!
    
    override func setupUI() {
        tableUser.dataSource = self
        tableUser.delegate = self
        tableUser.registerCell(SearchUserCell.self)
        navTitle = "Search User"
    }
    
    override func bindViewModel() {
        let keyWord = searchBar.rx.text.asDriver().debounce(0.5)
        let selected = tableUser.rx.itemSelected.asDriver().map({$0.row})
        let input = ViewModel.Input(keyWord: keyWord, selected: selected)
        let output = viewModel.transform(input, with: bag)
        
        output.users.drive(onNext:{[weak self] users in
            self?.tableUser.reloadData()
        }).disposed(by: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension SearchUserController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SearchUserCell.defaultHeight()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemUsers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(SearchUserCell.self)
        let user  = viewModel.item(at: indexPath.row)
        cell.bind(user)
        return cell
    }
    
}
