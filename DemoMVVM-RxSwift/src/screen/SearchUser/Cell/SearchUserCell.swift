//
//  SearchUserCell.swift
//  DemoMVVM-RxSwift
//
//  Created by phan.xuan.thuan on 9/17/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit
import Kingfisher

class SearchUserCell: UITableViewCell {

    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ivAvatar.roundView()
    }
    
    func bind(_ user:User){
        if let url = user.imageUrl {
            ivAvatar.kf.setImage(with: URL(string: url))
        }
        lblName.text = user.login
    }
    
    static func defaultHeight() -> CGFloat {
        return 100.0
    }
    
}
