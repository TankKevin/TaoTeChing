//
//  FileRW.swift
//  TiquForTao
//
//  Created by 谭凯文 on 2018/9/22.
//  Copyright © 2018年 Tan Kevin. All rights reserved.
//

import Foundation

func readString(from path: String) -> String? {
    let str: String
    do {
        str = try String.init(contentsOfFile: path, encoding: .utf8)
    } catch {
//        print(error.localizedDescription)
        return nil
    }
    return str
}
func writeString(_ str: String, to path: String) {
    do {
        //        print("Try to write to " + path)
        try str.write(toFile: path, atomically: true, encoding: .utf8)
    } catch {
        print(error.localizedDescription)
    }
}

func readString(ofFile name: String) -> String? {
    let path = NSHomeDirectory() + "/Documents/" + name
    return readString(from: path)
}

func writeString(_ str: String, toFile name: String) {
    let path = NSHomeDirectory() + "/Documents/" + name
    writeString(str, to: path)
}

func addWriteString(toFile name: String, addition: String) {
    // If the file doesn't exist, create a new file.
    var str = readString(ofFile: name) ?? ""
    str += addition
    writeString(str, toFile: name)
    
}

