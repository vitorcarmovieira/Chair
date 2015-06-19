//
//  Esporte.swift
//  Wchair
//
//  Created by Vitor on 6/15/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import Foundation
import CoreData

class Esporte: NSManagedObject {

    @NSManaged var modalidade: String
    @NSManaged var descricao: String
    @NSManaged var classificacao: String
    @NSManaged var modoDisputa: String
    @NSManaged var foto: NSData
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, modalidade:String, descricao:String, classificacao: String, modoDisputa: String, foto: NSData) ->Esporte{
        
        
        let esporte = NSEntityDescription.insertNewObjectForEntityForName("Esporte", inManagedObjectContext: moc) as! Esporte
        
        
        
        esporte.modalidade = modalidade
        
        esporte.descricao=descricao
        
        esporte.classificacao=classificacao
        
        esporte.modoDisputa=modoDisputa
        
        esporte.foto=foto
        
        
        
        
        
        return esporte
    }


}
