//
//  Equipamento.swift
//  Wchair
//
//  Created by Vitor on 6/15/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import Foundation
import CoreData

class Equipamento: NSManagedObject {

    @NSManaged var foto: NSData
    @NSManaged var loja: String
    @NSManaged var nome: String
    @NSManaged var site: String

    class func createInManagedObjectContext(moc: NSManagedObjectContext, foto: NSData, loja: String, nome: String, site: String) ->Equipamento{
            
            let equipamento = NSEntityDescription.insertNewObjectForEntityForName("Equipamento", inManagedObjectContext: moc) as! Equipamento
            
            equipamento.foto = foto
            equipamento.loja = loja
            equipamento.nome = nome
            equipamento.site = site
            
            return equipamento
    }
}
