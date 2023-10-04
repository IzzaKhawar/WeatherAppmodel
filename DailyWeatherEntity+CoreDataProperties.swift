//
//  DailyWeatherEntity+CoreDataProperties.swift
//  WeatherApp
//
//  Created by apple on 10/4/23.
//
//

import Foundation
import CoreData


extension DailyWeatherEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyWeatherEntity> {
        return NSFetchRequest<DailyWeatherEntity>(entityName: "DailyWeatherEntity")
    }

    @NSManaged public var date: String?
    @NSManaged public var minTemperature: String?
    @NSManaged public var maxTemperature: String?
    @NSManaged public var weatherMain: String?
    @NSManaged public var weatherModel: WeatherModelEntity?

}

extension DailyWeatherEntity : Identifiable {

}
