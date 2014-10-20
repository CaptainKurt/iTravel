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
    
    convenience init(dictionary: NSDictionary) {
        
        var title = dictionary["title"] as? String
        var description = dictionary["description"] as? String
        var location = dictionary["location"] as? String
        
        assert(title != nil && description != nil && location != nil, "the dictionary must have title, description and location keys")
        
        var imageData = dictionary["image-data"] as? NSData
        var image: UIImage?
        if imageData != nil {
            image = UIImage(data: imageData!)
        }
        
        self.init(title: title!, location: location!, description: description!, image: image)
    }
    
    func toPropertyListObject() -> NSDictionary
    {
        
        var dictionary: NSMutableDictionary = [
            "title": title,
            "description": description,
            "location": location
        ]
        
        if image != nil {
            dictionary["image-data"] = UIImageJPEGRepresentation(image, 0.7)
        }
        
        return dictionary
    }
}