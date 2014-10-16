//
//  TripsViewController.swift
//  iTravel
//
//  Created by Kurt Walker on 10/13/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class TripsViewController: UITableViewController, UINavigationBarDelegate, UISearchDisplayDelegate, UISearchBarDelegate {

    let tripManager = TripManager.sharedTripManager
    
    var filteredTrips : [Trip]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == searchDisplayController!.searchResultsTableView {
            if filteredTrips == nil {
                return 0
            }
            else {
                return filteredTrips!.count
            }
        }
        else {
            return tripManager.trips.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TripsTableViewCell", forIndexPath: indexPath) as UITableViewCell

        var trip: Trip
        
        if tableView == searchDisplayController!.searchResultsTableView {
            trip = filteredTrips![indexPath.row]
        }
        else {
            trip = tripManager.trips[indexPath.row]
        }
        
        
        cell.textLabel?.text = trip.title
        cell.detailTextLabel?.text = trip.description
        cell.imageView?.image = trip.image

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tripManager.trips.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        let tripToMove = tripManager.trips[fromIndexPath.row]
        tripManager.trips.removeAtIndex(fromIndexPath.row)
        tripManager.trips.insert(tripToMove, atIndex: toIndexPath.row)
    }


    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "tripDetailSegue" {
            let destinationViewController = segue.destinationViewController as TripDetailViewController
            
            if searchDisplayController!.active {
                if let selectedRow = searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()?.row {
                    destinationViewController.trip = filteredTrips?[selectedRow]
                }
            }
            else {
                
                let trip = tripManager.trips[tableView.indexPathForSelectedRow()!.row]
                destinationViewController.trip = trip
            }
            
            let trip = tripManager.trips[tableView.indexPathForSelectedRow()!.row]
            
            destinationViewController.trip = trip
        }
        
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        
        let filteredTrips = tripManager.filteredTripsForSearchText(searchString)
        
        return true
    }

}
