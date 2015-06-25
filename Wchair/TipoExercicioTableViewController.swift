//
//  TipoExercicioTableViewController.swift
//  Wchair
//
//  Created by Vitor on 6/20/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit
import CoreData

class TipoExercicioTableViewController: UITableViewController {

    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var items = [GCSimpleSectionController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var ombro: GCSimpleSectionController = GCSimpleSectionController(viewController: self)
//        ombro.setTitle("Ombro")
        var costa: GCSimpleSectionController = GCSimpleSectionController(viewController: self)
//        costa.setTitle("Costa")
        var bi: GCSimpleSectionController = GCSimpleSectionController(viewController: self)
//        bi.setTitle("Biceps")
        var tri: GCSimpleSectionController = GCSimpleSectionController(viewController: self)
//        tri.setTitle("Triceps")
        items = [ombro, costa, bi, tri]
        self.tableView.reloadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        var sectionController: GCRetractableSectionController = self.items[section]
        let count = Int(sectionController.numberOfRow)
        return count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var sectionController: GCRetractableSectionController = self.items[indexPath.section]
        let index = UInt(indexPath.row)
        
        return sectionController.cellForRow(index)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return tableView.bounds.height/4-28
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var sectionController: GCRetractableSectionController = self.items[indexPath.section]
        
        let index = UInt(indexPath.row)
        
        return sectionController.didSelectCellAtRow(index)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
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
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var view = segue.destinationViewController as! GuiaTableViewController
        let fetchRequest = NSFetchRequest(entityName: "Exercicio")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Exercicio] {
            
            view.guiaItems = fetchResults
        }
        
    }

}
