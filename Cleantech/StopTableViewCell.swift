//
//  StopTableViewCell.swift
//  Cleantech
//
//  Created by Joseph Fedota on 4/24/20.
//  Copyright © 2020 23O2 Automatic. All rights reserved.
//

import UIKit

class StopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hiddenl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func goToTransaction(_ sender: Any) {
    }
    
}
