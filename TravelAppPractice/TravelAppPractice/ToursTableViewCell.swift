//
//  ToursTableViewCell.swift
//  TravelAppPractice
//
//  Created by Vishnu on 4/22/20.
//  Copyright © 2020 ideas2it. All rights reserved.
//

import UIKit

class ToursTableViewCell: UITableViewCell {

    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
