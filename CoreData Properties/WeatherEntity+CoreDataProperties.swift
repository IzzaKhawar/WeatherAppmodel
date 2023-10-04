//
//  WeatherEntity+CoreDataProperties.swift
//  WeatherApp
//
//  Created by apple on 10/4/23.
//
//

import Foundation
import CoreData


extension WeatherEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherEntity> {
        return NSFetchRequest<WeatherEntity>(entityName: "WeatherEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var main: String?
    @NSManaged public var desc: String?
    @NSManaged public var icon: String?
    @NSManaged public var list: ListEntity?

}

extension WeatherEntity : Identifiable {

}
