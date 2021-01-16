//
//  Int+Extensions.swift
//  TaoTeChing
//
//  Created by 谭凯文 on 2018/10/1.
//  Copyright © 2018 Tan Kevin. All rights reserved.
//

import Foundation

extension Int {
    var chinese: String {
        if self > 99 || self < 0 { return String(self) }
        let ones: Int = self % 10
        let tens: Int = self / 10
        
        let chars = "零一二三四五六七八九".map { $0 }
        
        let result: String = String([chars[tens]] + [Character("十")] + [chars[ones]])
        
        if self < 10 { return String(result.dropFirst(2)) }
        if self == 10 { return String(result.dropFirst().dropLast()) }
        if self < 20 { return String(result.dropFirst()) }
        if result.last! == "零" { return String(result.dropLast() ) }
            
        return result
    }
    
    func chineseChapterWithSpace(_ num: Int) -> String {
        var result = "\(self.chinese)章"
        for _ in 0..<num {
            result = String(result.reduce("") { (str, char) -> String in
                str + String(char) + (char == " " ? "" : " ")
            }.dropLast())
        }
        
        return result
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}
