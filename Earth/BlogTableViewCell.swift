//
//  BlogTableViewCell.swift
//  Earth
//
//  Created by Vojtěch Šebek on 07.09.16.
//  Copyright © 2016 Vojtěch Šebek. All rights reserved.
//

import UIKit

class BlogTableViewCell: UITableViewCell {

    @IBOutlet weak var tableImage: UIImageView!
    @IBOutlet weak var tableNameText: UILabel!
    @IBOutlet weak var partText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code


        //        self.tableImage.layer.cornerRadius = self.tableImage.frame.size.width / 2
//        self.tableImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
