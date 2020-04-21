//
//  ToursTableViewCell.swift
//  TravelAppPractice
//
//  Created by Vishnu on 4/17/20.
//  Copyright © 2020 ideas2it. All rights reserved.
//

import UIKit

class ToursTableViewCell: UITableViewCell {

    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var countryName: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
