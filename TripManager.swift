//
//  TripManager.swift
//  iTravel
//
//  Created by Kurt Walker on 10/13/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import Foundation
import UIKit

private let tripManagerInstance = TripManager()

class TripManager {
    
    var trips = [Trip]()
    
    class var sharedTripManager: TripManager {
        return tripManagerInstance
    }
    
    init() {
        let icelandTrip = Trip(
            title: "Fire and Ice",
            location: "Iceland",
            description: "Iceland is a Nordic island country marking the juncture between the North Atlantic and the Arctic Ocean. Iceland is volcanically and geologically active. Icelandic culture is founded upon the nation's Norse heritage. Most Icelanders are descendants of Norse and Gaelic settlers.",
            image: UIImage(named: "iceland"))
        trips.append(icelandTrip)
        
        let berlinTrip = Trip(
            title: "City of the Bear",
            location: "Berlin",
            description: "Berlin is the capital city of Germany and one of the 16 states of Germany. Berlin is a world city of culture, politics, media, and science. Its urban setting and historical legacy have made it a popular location for international film productions. A bear appears in the coat of arms of the city.",
            image: UIImage(named: "berlin"))
        trips.append(berlinTrip)
        
        let icelandTrip2 = Trip(
            title: "Fire and Ice2",
            location: "Iceland",
            description: "Iceland is a Nordic island country marking the juncture between the North Atlantic and the Arctic Ocean. Iceland is volcanically and geologically active. Icelandic culture is founded upon the nation's Norse heritage. Most Icelanders are descendants of Norse and Gaelic settlers.",
            image: UIImage(named: "iceland"))
        trips.append(icelandTrip2)
        
        let berlinTrip2 = Trip(
            title: "City of the Bear2",
            location: "Berlin",
            description: "Berlin is the capital city of Germany and one of the 16 states of Germany. Berlin is a world city of culture, politics, media, and science. Its urban setting and historical legacy have made it a popular location for international film productions. A bear appears in the coat of arms of the city.",
            image: UIImage(named: "berlin"))
        trips.append(berlinTrip2)
    }
    
    func filteredTripsForSearchText(searchText: String) -> [Trip] {
        
        let filteredTrips = trips.filter { (trip: Trip) -> Bool in
            
            let stringMatch = trip.title.rangeOfString(searchText, options: .CaseInsensitiveSearch)
            
            return stringMatch != nil
        }
        
        return filteredTrips
    }
    
}