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
    @IBOutlet weak var imageScroll: UIScrollView!
    
    var item: AnyObject?
    var tag: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let currentTag = NSUserDefaults.standardUserDefaults()
//        let tag = currentTag.valueForKey("tag") as! Int
        
        switch (self.tag!){
            
        case 1://Exercicio tipo1
            
            let exercicio = self.item as! Exercicio
//            exercicioImage.image = UIImage(data: exercicio.imageGuia)
            exercicioDescription.text = exercicio.detalhes
            
            self.title = exercicio.nome
            
        case 2://Exercicio tipo2
            
            let exercicio = self.item as! Exercicio
//            exercicioImage.image = UIImage(data: exercicio.imageGuia)
            exercicioDescription.text = exercicio.detalhes
            
            self.title = exercicio.nome
            
        case 3://Exercicio tipo3
            
            let exercicio = self.item as! Exercicio
//            exercicioImage.image = UIImage(data: exercicio.imageGuia)
            exercicioDescription.text = exercicio.detalhes
            
            self.title = exercicio.nome
            
        case 4://Exercicio tipo4
            
            let exercicio = self.item as! Exercicio
//            exercicioImage.image = UIImage(data: exercicio.imageGuia)
            exercicioDescription.text = exercicio.detalhes
            
            self.title = exercicio.nome
            
        case 5://ESPORTES
            
            let esporte = self.item as! Esporte
            exercicioDescription.text = esporte.descricao
            
            var colors:[UIColor] = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(), UIColor.yellowColor()]
            var frame: CGRect = CGRectMake(0, 0, 0, 0)
            
            for index in 0..<colors.count {
                
                frame.origin.x = self.imageScroll.frame.size.width * CGFloat(index)
                frame.size = self.imageScroll.frame.size
                self.imageScroll.pagingEnabled = true
                
                var subView = UIView(frame: frame)
                subView.backgroundColor = colors[index]
                self.imageScroll.addSubview(subView)
            }
            
            self.imageScroll.contentSize = CGSizeMake(self.imageScroll.frame.size.width * CGFloat(colors.count), self.imageScroll.frame.size.height)
            
            self.title = esporte.modalidade
            
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
