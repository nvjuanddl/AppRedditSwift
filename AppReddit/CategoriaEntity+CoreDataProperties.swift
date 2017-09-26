//
//  CategoriaEntity+CoreDataProperties.swift
//  AppReddit
//
//  Created by Mobile App on 25/09/17.
//  Copyright © 2017 nvjuanddl. All rights reserved.
//

import Foundation
import CoreData


extension CategoriaEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoriaEntity> {
        return NSFetchRequest<CategoriaEntity>(entityName: "CategoriaEntity");
    }
    
    @NSManaged public var nombreCategoria: String
    @NSManaged public var appEntity: AppEntity
    
}
