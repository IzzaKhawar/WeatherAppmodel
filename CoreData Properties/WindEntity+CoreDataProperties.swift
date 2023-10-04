//
//  WindEntity+CoreDataProperties.swift
//  WeatherApp
//
//  Created by apple on 10/4/23.
//
//

import Foundation
import CoreData


extension WindEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WindEntity> {
        return NSFetchRequest<WindEntity>(entityName: "WindEntity")
    }

    @NSManaged public var speed: Double
    @NSManaged public var gust: Double
    @NSManaged public var deg: Int32
    @NSManaged public var list: ListEntity?

}

extension WindEntity : Identifiable {

}
