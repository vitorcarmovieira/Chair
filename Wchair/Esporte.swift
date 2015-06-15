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

}
