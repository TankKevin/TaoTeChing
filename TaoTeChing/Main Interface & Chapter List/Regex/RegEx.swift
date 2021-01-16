//
//  RegEx.swift
//  
//
//  Created by 谭凯文 on 2018/9/10.
//  Copyright © 2018年 Tan Kevin. All rights reserved.
//

import Foundation

// Give a pattern of string, the source string, output is the nsrange of the matched substring
// Instead of returning [String] for more clarity, we use [NSRange] to avoid copying large data when returns
func matchedSub(pattern: String, source: String, _ options: NSRegularExpression.Options) -> [NSRange] {
    let regex: NSRegularExpression
    
    do {
        regex = try NSRegularExpression(pattern: pattern, options: options)
    } catch {
        print(error.localizedDescription)
        return []
    }
    
    return regex.matches(in: source, options: [], range: NSRange(location: 0, length: source.count)).map { $0.range }
}

// Give an NSRange and the source string, return the result sub-string made by the range as String
func sub(range: NSRange, source: String) -> String {
    return String((source as NSString).substring(with: range))
}


// If there is only one possible match, then can skip the upper two functions, use this function to directly get the matched string
func onlyMatch(pattern: String, source: String, _ options: NSRegularExpression.Options) -> String? {
    let matches = matchedSub(pattern: pattern, source: source, options)
    guard let first = matches.first else { return nil }
//    print(sub(range: first, source: source))
    return sub(range: first, source: source)
}

// Replace texts matching with a specific pattern
func replaceMatches(pattern: String, source: String, template: String, _ options: NSRegularExpression.Options) -> String {
    let regex: NSRegularExpression
    
    do {
        regex = try NSRegularExpression(pattern: pattern, options: options)
    } catch {
        print(error.localizedDescription)
        return "Error occurred."
    }
    
    let result = NSMutableString(string: source)
    
    regex.replaceMatches(in: result, options: [], range: NSRange(location: 0, length: source.count), withTemplate: template)
    
    return result as String
}


