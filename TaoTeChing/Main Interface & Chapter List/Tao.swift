//
//  Tao.swift
//  TaoTeChing
//
//  Created by 谭凯文 on 2018/10/6.
//  Copyright © 2018 Tan Kevin. All rights reserved.
//

import Foundation

struct Tao {
    let number: Int
    let origin: String
    let translation: String
    var favorite: Bool {
        didSet {
            // Add this chapter to favorites.txt
            addWriteString(toFile: "favorites.txt", addition: "\(number),")
//            print(readString(ofFile: "favorites.txt"))
        }
    }
    
}


