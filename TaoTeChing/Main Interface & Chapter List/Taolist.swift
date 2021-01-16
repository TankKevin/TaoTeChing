//
//  Taolist.swift
//  TaoTeChing
//
//  Created by 谭凯文 on 2018/9/21.
//  Copyright © 2018年 Tan Kevin. All rights reserved.
//

// This is the data source of the Tao list

import UIKit

class Taolist: NSObject, UITableViewDataSource {
    
    var list: [Tao]
    
    // Get all the chapters here for only one time, there will be no more reaches later, the chapter object will be passed around
    init(forResource resource: String) {
        
        let path = Bundle.main.path(forResource: resource, ofType: nil) ?? ""
        
        let content = readString(from: path)
        
        let origins = getOriginals(from: content!)
        let translations = getTranslations(from: content!)
        
        list = []
        let str = readString(ofFile: "favorites.txt") ?? ""
        let times = str.split(separator: Character(",")).map { String($0) }
        for i in 0...80 {
            
            let favorite = times.filter { $0 == String(i) }.count.isOdd
            list.append(Tao(number: i, origin: origins[i], translation: translations[i], favorite: favorite))
        }
        
        super.init()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterCell", for: indexPath) as! ChapterCell
        
        cell.title.text = (indexPath.row + 1).chineseChapterWithSpace(1)
        cell.detail.text = String(list[indexPath.row].origin.dropFirst())
        
        // ? means something wrong here
        cell.icon.text = String(list[indexPath.row].origin.first ?? Character("?"))
        
        // Choose to hide the star icon
        cell.favIcon.isHidden = !(list[indexPath.row].favorite)
        
        return cell
    }
    
    
}
