//
//  AppEntity+CoreDataProperties.swift
//  AppReddit
//
//  Created by Mobile App on 25/09/17.
//  Copyright © 2017 nvjuanddl. All rights reserved.
//

import Foundation
import CoreData

extension AppEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppEntity> {
        return NSFetchRequest<AppEntity>(entityName: "AppEntity");
    }
    
    @NSManaged public var nombreApp     : String
    @NSManaged public var detalleApp    : String
    @NSManaged public var imagenApp     : String
    @NSManaged public var imagenHeader  : String
    
}
