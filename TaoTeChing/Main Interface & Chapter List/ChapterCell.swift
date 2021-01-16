//
//  ChapterCell.swift
//  TaoTeChing
//
//  Created by 谭凯文 on 2018/10/2.
//  Copyright © 2018 Tan Kevin. All rights reserved.
//

import UIKit

class ChapterCell: UITableViewCell {

    @IBOutlet var icon: UILabel! {
        didSet {
//            print(icon.frame)
//            print(icon.layer.cornerRadius)
            icon.layer.cornerRadius = icon.frame.height / 2
//            print(icon.layer.cornerRadius)
            icon.clipsToBounds = true
//            icon.layer.masksToBounds = true
//            print("Successfully change square to circle.")
        }
    }
    @IBOutlet var title: UILabel!
    @IBOutlet var detail: UILabel!
    @IBOutlet var favIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
