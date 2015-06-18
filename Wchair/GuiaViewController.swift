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
        
        var imageBasquete = UIImagePNGRepresentation(UIImage (named: "Basquete3"));
        
        if let moc = self.managedObjectContext{
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para o Peitoral", idEquipamento: "1", imageGuia: NSData(), nome: "Puxador Alto Atrás da Nuca", tempo: "30min", vezesPraticadas: 45);
            //
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para as Costas", idEquipamento: "1", imageGuia: NSData(), nome: "Crucifixo na Polia", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para as Costas", idEquipamento: "1", imageGuia: NSData(), nome: "Puxador Fechado", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Ombros", idEquipamento: "1", imageGuia: NSData(), nome: "Elevação Lateral", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Ombros", idEquipamento: "1", imageGuia: NSData(), nome: "Elástico de Tensão", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Ombros", idEquipamento: "1", imageGuia: NSData(), nome: "Desenvolvimento com Hálteres", tempo: "30min", vezesPraticadas: 45);
            //
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Bíceps", idEquipamento: "1", imageGuia: NSData(), nome: "Rosca Simultânea.", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Bíceps", idEquipamento: "1", imageGuia: NSData(), nome: "Rosca Individual Polia Alta", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Tríceps", idEquipamento: "1", imageGuia: NSData(), nome: "Pulley Tríceps", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Tríceps", idEquipamento: "1", imageGuia: NSData(), nome: "Pulley Corda", tempo: "30min", vezesPraticadas: 45);
            
            Esporte.createInManagedObjectContext(moc, modalidade: "BASQUETE", descricao: "A modalidade é praticada por atletas de ambos os sexos que tenham alguma deficiência físico-motora, sob as regras adaptadas da Federação Internacional de Basquete em Cadeira de Rodas (IWBF). As cadeiras são adaptadas e padronizadas, conforme previsto na regra. No Brasil, a modalidade é administrada pela Confederação Brasileira de Basquetebol em Cadeira de Rodas (CBBC).", classificacao: "Na classificação funcional, os atletas são avaliados conforme o comprometimento físico-motor em uma escala de 1 a 4,5. Quanto maior a deficiência, menor a classe. A soma desses números na equipe de cinco pessoas não pode ultrapassar 14.", modoDisputa: "O jogador deve quicar, arremessar ou passar a bola a cada dois toques dados na cadeira. As dimensões da quadra e a altura da cesta seguem o padrão do basquete olímpico. São disputados quatro quartos de 10 minutos cada.", foto:imageBasquete );
        }
        
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
    
    func save() {
        var error : NSError?
        if(managedObjectContext!.save(&error) ) {
            println(error?.localizedDescription)
        }
    }

}
