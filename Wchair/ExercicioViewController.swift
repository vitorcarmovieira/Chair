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
    var tag: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let currentTag = NSUserDefaults.standardUserDefaults()
//        let tag = currentTag.valueForKey("tag") as! Int
        
        switch (self.tag!){
            
        case 1://Exercicio tipo1
            
            let exercicio = self.item as! Exercicio
            exercicioImage.image = UIImage(data: exercicio.imageGuia)
            exercicioDescription.text = exercicio.detalhes
            
        case 2://Exercicio tipo2
            
            let exercicio = self.item as! Exercicio
            exercicioImage.image = UIImage(data: exercicio.imageGuia)
            exercicioDescription.text = exercicio.detalhes
            
        case 3://Exercicio tipo3
            
            let exercicio = self.item as! Exercicio
            exercicioImage.image = UIImage(data: exercicio.imageGuia)
            exercicioDescription.text = exercicio.detalhes
            
        case 4://Exercicio tipo4
            
            let exercicio = self.item as! Exercicio
            exercicioImage.image = UIImage(data: exercicio.imageGuia)
            exercicioDescription.text = exercicio.detalhes
            
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
