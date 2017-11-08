//
//  MenuTableViewCell.swift
//  main client
//
//  Created by Илья on 30.10.2017.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // IndexPath.row?
        // myTitle[2]?
        if self.labelText.text == "Map" {
            if AppDelegate.isMap {
                
            }
        }
        
        // Configure the view for the selected state
    }
}
