//
//  WeatherMode+CoreDataProperties.swift
//  WeatherApp
//
//  Created by apple on 9/30/23.
//
//

import Foundation
import CoreData


extension WeatherMode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherMode> {
        return NSFetchRequest<WeatherMode>(entityName: "WeatherMode")
    }

    @NSManaged public var country: String?
    @NSManaged public var desc: String?
    @NSManaged public var icon: String?
    @NSManaged public var id: Double
    @NSManaged public var main: String?
    @NSManaged public var name: String?
    @NSManaged public var temp: Double
    @NSManaged public var tempMax: Double
    @NSManaged public var tempMin: Double
    @NSManaged public var timezome: Double

}

extension WeatherMode : Identifiable {

}
