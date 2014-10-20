//
//  TripCell.swift
//  iTravel
//
//  Created by Kurt Walker on 10/20/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class TripCell: UITableViewCell {

    @IBOutlet weak var tripTitleLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripLocationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tripImageView.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tripImageView.layer.cornerRadius = tripImageView.bounds.width/2.0
    }

}
