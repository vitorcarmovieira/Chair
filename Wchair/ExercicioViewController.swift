//
//  ExercicioViewController.swift
//  Wchair
//
//  Created by Vitor on 6/17/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit

class ExercicioViewController: UIViewController {

    @IBOutlet weak var exercicioDescription: UITextView!
    @IBOutlet weak var exercicioImage: UIImageView!
    
    var item: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let currentTag = NSUserDefaults.standardUserDefaults()
        let tag = currentTag.valueForKey("tag") as! Int
        
        switch (tag){
            
        case 1:
            println("exercicios 1")
        case 2:
            println("exercicios 2")
        case 3:
            println("exercicios 3")
        case 4:
            println("exercicios 4")
        case 5://ESPORTES
            let esporte = self.item as! Esporte
            exercicioImage.image = UIImage(data: esporte.foto)
            exercicioDescription.text = esporte.descricao
        default:
            println("exercicios 0")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
