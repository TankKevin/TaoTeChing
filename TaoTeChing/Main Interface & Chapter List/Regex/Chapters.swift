//
//  Chapters.swift
//  TiquForTao
//
//  Created by 谭凯文 on 2018/9/22.
//  Copyright © 2018年 Tan Kevin. All rights reserved.
//

import Foundation

func getOriginals(from content: String) -> [String] {
    
    // Something really tricky: if we don't get the full version of the text i.e. TaoTeChing.txt, the matches are not completed, only 77 chapters are matched. While if we add more contents or, do not delete much contents as we did, we can get the full matches.
    
    
    //"(?<=\\n)([一二三四五六七八九十])(\\1 )*?章(?=\\n)"
    let pattern = "(?<=\\n)[一二三四五六七八九十]([一二三四五六七八九十]|　)*?章.*?(?=\\s{4}【注释】)"
    
    let matches = matchedSub(pattern: pattern, source: content, [.dotMatchesLineSeparators])
    //print(matches.count)
    //for match in matches {
    //    print(sub(range: match, source: content))
    //}
    
    // Get every chapter in [String]
    let originals0 = matches.map { sub(range: $0, source: content) }
    
    /*
    // Filter ①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳㉑㉒㉓
    // FIXME: Do not understand why some of the numbers cannot be removed. This sucks.
    // Hahaha: There is no need to do this step, because I do the fuck in the txt file.hhhhh
    
    let originals1 = originals0.map { replaceMatches(pattern: "[①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳㉑㉒㉓]", source: $0, template: "", []) }
    */
    
    // Filter chapter title
    let originals1 = originals0.map { replaceMatches(pattern: "[一二三四五六七八九十]([一二三四五六七八九十]|　)*?章\\r\\n\\r\\n\\r\\n", source: $0, template: "", [])}
    // If don't want the \r\n
     .map { replaceMatches(pattern: "\\r\\n", source: $0, template: "", [])}
    
    return originals1
    
}


func getTranslations(from content: String) -> [String] {
    let pattern = "(?<=【今译】\\s{4}).*?(?=\\s{12}【引述】)"
    
    let matches = matchedSub(pattern: pattern, source: content, [.dotMatchesLineSeparators])
    
    let translations0 = matches.map { sub(range: $0, source: content) }
        // If don't want the \r\n
        .map { replaceMatches(pattern: "\\r\\n", source: $0, template: "", [])}
    
    
    return translations0
}
