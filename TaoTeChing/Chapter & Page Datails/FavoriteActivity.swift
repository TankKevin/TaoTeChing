//
//  FavoriteActivity.swift
//  TaoTeChing
//
//  Created by 谭凯文 on 2018/10/6.
//  Copyright © 2018 Tan Kevin. All rights reserved.
//

import UIKit

class FavoriteActivity: UIActivity {
    let number: Int
    let taoList: Taolist
//    var favorite: Bool
    
    override var activityTitle: String? {
        return taoList.list[number].favorite ? "取消收藏" : "收藏"
        
    }
    
    override var activityImage: UIImage? {
//        return taoList.list[number].favorite ? UIImage() : UIImage(named: "
        let image = UIImage(named: "tao")
        
        return image
    }
    
    override func activityDidFinish(_ completed: Bool) {
        taoList.list[number].favorite = !(taoList.list[number].favorite)
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    
    
    init(number: Int, taoList: Taolist) {
        self.taoList = taoList
        self.number = number

        super.init()
    }
    
    
}

