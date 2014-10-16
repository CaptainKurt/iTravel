//
//  EditTripViewController.swift
//  iTravel
//
//  Created by Imre Kelényi on 14.10.13..
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

import MessageUI

class EditTripViewController: UITableViewController {
    
    var trip: Trip!

    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripTitleTextField: UITextField!
    @IBOutlet weak var tripLocationTextField: UITextField!
    @IBOutlet weak var tripDescriptionTextView: UITextView!
    @IBOutlet weak var tapLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let initialTrip = self.trip {
            tripImageView.image = initialTrip.image
            tripTitleTextField.text = initialTrip.title
            tripLocationTextField.text = initialTrip.location
            tripDescriptionTextView.text = initialTrip.description
        }
    }

    @IBAction func cancelButtonTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil);
    }

    @IBAction func saveButtonTap(sender: AnyObject) {
        if trip == nil {
            trip = Trip(title: tripTitleTextField.text, location: tripLocationTextField.text, description: tripDescriptionTextView.text, image: tripImageView.image)
            
            TripManager.sharedTripManager.trips.append(trip)
        }
        
        dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func handleImageTap(sender: UITapGestureRecognizer) {        
    }
    
}
