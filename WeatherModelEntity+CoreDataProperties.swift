//
//  WeatherModelEntity+CoreDataProperties.swift
//  
//
//  Created by apple on 10/9/23.
//
//

import Foundation
import CoreData


extension WeatherModelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherModelEntity> {
        return NSFetchRequest<WeatherModelEntity>(entityName: "WeatherModelEntity")
    }

    @NSManaged public var cnt: Int16
    @NSManaged public var cod: String?
    @NSManaged public var message: Int16
    @NSManaged public var city: CityEntity?
    @NSManaged public var dailyWeather: NSSet?
    @NSManaged public var hourlyWeather: NSSet?
    @NSManaged public var list: NSSet?
   

}

// MARK: Generated accessors for dailyWeather
extension WeatherModelEntity {

    @objc(addDailyWeatherObject:)
    @NSManaged public func addToDailyWeather(_ value: DailyWeatherEntity)

    @objc(removeDailyWeatherObject:)
    @NSManaged public func removeFromDailyWeather(_ value: DailyWeatherEntity)

    @objc(addDailyWeather:)
    @NSManaged public func addToDailyWeather(_ values: NSSet)

    @objc(removeDailyWeather:)
    @NSManaged public func removeFromDailyWeather(_ values: NSSet)

}

// MARK: Generated accessors for hourlyWeather
extension WeatherModelEntity {

    @objc(addHourlyWeatherObject:)
    @NSManaged public func addToHourlyWeather(_ value: HourlyWeatherEntity)

    @objc(removeHourlyWeatherObject:)
    @NSManaged public func removeFromHourlyWeather(_ value: HourlyWeatherEntity)

    @objc(addHourlyWeather:)
    @NSManaged public func addToHourlyWeather(_ values: NSSet)

    @objc(removeHourlyWeather:)
    @NSManaged public func removeFromHourlyWeather(_ values: NSSet)

}

// MARK: Generated accessors for list
extension WeatherModelEntity {

    @objc(addListObject:)
    @NSManaged public func addToList(_ value: ListEntity)

    @objc(removeListObject:)
    @NSManaged public func removeFromList(_ value: ListEntity)

    @objc(addList:)
    @NSManaged public func addToList(_ values: NSSet)

    @objc(removeList:)
    @NSManaged public func removeFromList(_ values: NSSet)

}
