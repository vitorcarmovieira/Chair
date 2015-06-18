//
//  Exercicio.swift
//  Wchair
//
//  Created by Vitor on 6/15/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import Foundation
import CoreData

class Exercicio: NSManagedObject {

    @NSManaged var animacao: NSData
    @NSManaged var detalhes: String
    @NSManaged var idEquipamento: String
    @NSManaged var imageGuia: NSData
    @NSManaged var nome: String
    @NSManaged var tempo: String
    @NSManaged var vezesPraticadas: NSDecimalNumber
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, animacao: NSData, detalhes: String, idEquipamento: String,
        imageGuia: NSData, nome: String, tempo: String, vezesPraticadas: NSDecimalNumber) ->Exercicio{
            
            let exercicio = NSEntityDescription.insertNewObjectForEntityForName("Exercicio", inManagedObjectContext: moc) as! Exercicio
            
            exercicio.animacao = animacao
            exercicio.detalhes = detalhes
            exercicio.idEquipamento = idEquipamento
            exercicio.imageGuia = imageGuia
            exercicio.nome = nome
            exercicio.tempo = tempo
            exercicio.vezesPraticadas = vezesPraticadas
            
            
            return exercicio
    }

}
