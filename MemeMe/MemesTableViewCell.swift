//
//  MemesTableViewCell.swift
//  MemeMe
//
//  Created by Sebastian Drew on 8/31/15.
//  Copyright (c) 2015 los. All rights reserved.
//

import UIKit

class MemesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var memeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

