//
//  Usuario.swift
//  Wchair
//
//  Created by Vitor on 6/15/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import Foundation
import CoreData

class Usuario: NSManagedObject {

    @NSManaged var avatar: NSData
    @NSManaged var email: String
    @NSManaged var nome: String
    @NSManaged var senha: String
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, avatar: NSData, email: String, nome: String, senha: String) ->Usuario{
            
            let user = NSEntityDescription.insertNewObjectForEntityForName("Usuario", inManagedObjectContext: moc) as! Usuario
            
            user.nome = nome
            user.avatar = avatar
            user.email = email
            user.senha = senha
            
            return user
    }

}
