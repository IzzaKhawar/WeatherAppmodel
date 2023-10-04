//
//  SysEntity+CoreDataProperties.swift
//  WeatherApp
//
//  Created by apple on 10/4/23.
//
//

import Foundation
import CoreData


extension SysEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SysEntity> {
        return NSFetchRequest<SysEntity>(entityName: "SysEntity")
    }

    @NSManaged public var pod: String?
    @NSManaged public var list: ListEntity?

}

extension SysEntity : Identifiable {

}
