//
//  CloudsEntity+CoreDataProperties.swift
//  WeatherApp
//
//  Created by apple on 10/4/23.
//
//

import Foundation
import CoreData


extension CloudsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CloudsEntity> {
        return NSFetchRequest<CloudsEntity>(entityName: "CloudsEntity")
    }

    @NSManaged public var all: Int32
    @NSManaged public var list: ListEntity?

}

extension CloudsEntity : Identifiable {

}
