//
//  GuiaTableViewController.swift
//  Wchair
//
//  Created by Vitor on 6/15/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import CoreData
import UIKit

class GuiaTableViewController: UITableViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var guiaItems = [AnyObject]()
    var tag:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if guiaItems.count == 0{
            
            let fetchRequest = NSFetchRequest(entityName: "Esporte")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Esporte] {
                self.guiaItems = fetchResults
            }
            
            let currentTag = NSUserDefaults.standardUserDefaults()
            currentTag.setValue(5, forKey: "tag")
            self.tag = 5
        }
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
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return guiaItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! GuiaTableViewCell

        switch (self.tag!){
            
        case 1://Exercicio tipo1
            
            let item = self.guiaItems[indexPath.row] as! Exercicio
            cell.name.text = item.nome
            cell.imagem.image = UIImage(data: item.imageGuia)
            
        case 2://Exercicio tipo2
            
            let item = self.guiaItems[indexPath.row] as! Exercicio
            cell.name.text = item.nome
            cell.imagem.image = UIImage(data: item.imageGuia)
            
        case 3://Exercicio tipo3
            
            let item = self.guiaItems[indexPath.row] as! Exercicio
            cell.name.text = item.nome
            cell.imagem.image = UIImage(data: item.imageGuia)
            
        case 4://Exercicio tipo4
            
            let item = self.guiaItems[indexPath.row] as! Exercicio
            cell.name.text = item.nome
            cell.imagem.image = UIImage(data: item.imageGuia)
            
        case 5://ESPORTES
            
            let item = self.guiaItems[indexPath.row] as! Esporte
            cell.name.text = item.modalidade
            cell.imagem.image = UIImage(data: item.foto)
            
        default:
            println("exercicios 0")
        }

        return cell
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
        
        switch (self.tag!){
            
        case 1://Exercicio tipo1
            
            var view = segue.destinationViewController as! ExercicioViewController
            let index: NSIndexPath = self.tableView.indexPathForSelectedRow()!
            view.item = self.guiaItems[index.row]
            view.tag = self.tag
            
        case 2://Exercicio tipo2
            
            var view = segue.destinationViewController as! ExercicioViewController
            let index: NSIndexPath = self.tableView.indexPathForSelectedRow()!
            view.item = self.guiaItems[index.row]
            view.tag = self.tag
            
        case 3://Exercicio tipo3
            
            var view = segue.destinationViewController as! ExercicioViewController
            let index: NSIndexPath = self.tableView.indexPathForSelectedRow()!
            view.item = self.guiaItems[index.row]
            view.tag = self.tag
            
        case 4://Exercicio tipo4
            
            var view = segue.destinationViewController as! ExercicioViewController
            let index: NSIndexPath = self.tableView.indexPathForSelectedRow()!
            view.item = self.guiaItems[index.row]
            view.tag = self.tag
            
        case 5://ESPORTES
            
            var view = segue.destinationViewController as! ExercicioViewController
            let index: NSIndexPath = self.tableView.indexPathForSelectedRow()!
            view.item = self.guiaItems[index.row]
            view.tag = self.tag
            
        default:
            println("exercicios 0")
        }
    }

}
