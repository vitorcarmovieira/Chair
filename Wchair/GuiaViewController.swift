//
//  GuiaViewController.swift
//  Wchair
//
//  Created by Vitor on 6/15/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit
import CoreData

class GuiaViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func exercicios(sender: AnyObject) {
        
        
    }
    
    @IBAction func esportes(sender: AnyObject) {
        
        
    }
    @IBAction func beneficios(sender: AnyObject) {
        
        
    }
    @IBAction func associacoes(sender: AnyObject) {
        
        
    }
    
    func fetchPics() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
//        if segue.identifier == "exercicio"{
//            
//            var view = segue.destinationViewController as! GuiaTableViewController
//            
//            let fetchRequest = NSFetchRequest(entityName: "Exercicios")
//            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Exercicio] {
//                view.guiaItems = fetchResults
//            }
//        } else if segue.identifier == "esportes"{
//            
//            
//                } else if segue.identifier == "beneficios"{
//            
//                        } else {
//            
//                            }
//        
        switch (segue.identifier)!{ //falta fazer um where para pegar os tipos de cada segue 😊
            
        case "tipo1":
            var view = segue.destinationViewController as! GuiaTableViewController
            let fetchRequest = NSFetchRequest(entityName: "Exercicio")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Exercicio] {
                
                view.guiaItems = fetchResults
            }
        case "tipo2":
            var view = segue.destinationViewController as! GuiaTableViewController
            let fetchRequest = NSFetchRequest(entityName: "Exercicio")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Exercicio] {
                
                view.guiaItems = fetchResults
            }
        case "tipo3":
            var view = segue.destinationViewController as! GuiaTableViewController
            let fetchRequest = NSFetchRequest(entityName: "Exercicio")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Exercicio] {
                
                view.guiaItems = fetchResults
            }
        case "tipo4":
            var view = segue.destinationViewController as! GuiaTableViewController
            let fetchRequest = NSFetchRequest(entityName: "Exercicio")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Exercicio] {
                
                view.guiaItems = fetchResults
            }
        default:
            println("segue não identificada")
        }
    }

}
