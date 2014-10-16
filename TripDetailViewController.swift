//
//  TripDetailViewController.swift
//  iTravel
//
//  Created by Kurt Walker on 10/13/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class TripDetailViewController: UITableViewController {
    
    var trip: Trip!
    
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripLocationLabel: UILabel!
    @IBOutlet weak var tripDescriptionTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tripImageView.image = trip.image
        tripLocationLabel.text = trip.location
        tripDescriptionTextView.text = trip.description
        
        navigationItem.title = trip.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "editTripSegue" {
            
            let navigationController = segue.destinationViewController as UINavigationController
            let editTripViewController = navigationController.topViewController as EditTripViewController
            
            editTripViewController.trip = trip
            
        }
    }


}
