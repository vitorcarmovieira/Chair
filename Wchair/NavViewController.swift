//
//  NavViewController.swift
//  Wchair
//
//  Created by Vitor on 6/18/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit
import CoreData

class NavViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        var view = segue.destinationViewController as! GuiaTableViewController
//        let fetchRequest = NSFetchRequest(entityName: "Esporte")
//        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Esporte] {
//            
//            view.guiaItems = fetchResults
//        }
//    }

}
