//
//  Local.swift
//  Wchair
//
//  Created by Vitor on 6/15/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import Foundation
import CoreData

class Local: NSManagedObject {

    @NSManaged var cor: String
    @NSManaged var info: String
    @NSManaged var latitude: String
    @NSManaged var longitude: String
    @NSManaged var nome: String

    class func createInManagedObjectContext(moc: NSManagedObjectContext, cor: String, info: String, latitude: String, longitude: String,
        nome: String) ->Local{
            
            let local = NSEntityDescription.insertNewObjectForEntityForName("Local", inManagedObjectContext: moc) as! Local
            
            local.cor = cor
            local.info = info
            local.latitude = latitude
            local.longitude = longitude
            local.nome = nome
            
            return local
    }
}
