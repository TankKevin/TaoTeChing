//
//  RWTextCell.swift
//  TaoTeChing
//
//  Created by 谭凯文 on 2018/10/1.
//  Copyright © 2018 Tan Kevin. All rights reserved.
//

import UIKit

class RWTextCell: UITableViewCell {

    @IBOutlet var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
