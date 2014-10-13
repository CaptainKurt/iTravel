//
//  Trip.swift
//  iTravel
//
//  Created by Kurt Walker on 10/13/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import Foundation
import UIKit

// Data Model
class Trip {
    
    var title: String
    var description: String
    var location: String
    var image: UIImage?
    
    init(title: String, location: String, description: String, image: UIImage? = nil)
    {
        self.title = title
        self.description = description
        self.location = location
        self.image = image
    }
}