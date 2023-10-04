//
//  MainEntity+CoreDataProperties.swift
//  WeatherApp
//
//  Created by apple on 10/4/23.
//
//

import Foundation
import CoreData


extension MainEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MainEntity> {
        return NSFetchRequest<MainEntity>(entityName: "MainEntity")
    }

    @NSManaged public var temp: String?
    @NSManaged public var feels_like: Double
    @NSManaged public var temp_min: String?
    @NSManaged public var temp_max: String?
    @NSManaged public var pressure: Int32
    @NSManaged public var sea_level: Int32
    @NSManaged public var grnd_level: Int32
    @NSManaged public var humidity: Int32
    @NSManaged public var temp_kf: Double
    @NSManaged public var list: ListEntity?

}

extension MainEntity : Identifiable {

}
