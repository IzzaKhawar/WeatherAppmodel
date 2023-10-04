//
//  ListEntity+CoreDataProperties.swift
//  WeatherApp
//
//  Created by apple on 10/4/23.
//
//

import Foundation
import CoreData


extension ListEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListEntity> {
        return NSFetchRequest<ListEntity>(entityName: "ListEntity")
    }

    @NSManaged public var dt: Int32
    @NSManaged public var visibility: Int32
    @NSManaged public var pop: Double
    @NSManaged public var dt_txt: String?
    @NSManaged public var main: MainEntity?
    @NSManaged public var weather: NSSet?
    @NSManaged public var clouds: CloudsEntity?
    @NSManaged public var wind: WindEntity?
    @NSManaged public var sys: ListEntity?
    @NSManaged public var weatherModel: WeatherModelEntity?

}

// MARK: Generated accessors for weather
extension ListEntity {

    @objc(addWeatherObject:)
    @NSManaged public func addToWeather(_ value: WeatherEntity)

    @objc(removeWeatherObject:)
    @NSManaged public func removeFromWeather(_ value: WeatherEntity)

    @objc(addWeather:)
    @NSManaged public func addToWeather(_ values: NSSet)

    @objc(removeWeather:)
    @NSManaged public func removeFromWeather(_ values: NSSet)

}

extension ListEntity : Identifiable {

}
