//
//  HourlyWeatherEntity+CoreDataProperties.swift
//  WeatherApp
//
//  Created by apple on 10/4/23.
//
//

import Foundation
import CoreData


extension HourlyWeatherEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HourlyWeatherEntity> {
        return NSFetchRequest<HourlyWeatherEntity>(entityName: "HourlyWeatherEntity")
    }

    @NSManaged public var date: Int32
    @NSManaged public var timestamp: String?
    @NSManaged public var temperature: String?
    @NSManaged public var weatherMain: String?
    @NSManaged public var weatherModel: WeatherModelEntity?

}

extension HourlyWeatherEntity : Identifiable {

}
