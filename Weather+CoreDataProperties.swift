//
//  Weather+CoreDataProperties.swift
//  
//
//  Created by apple on 9/28/23.
//
//

import Foundation
import CoreData


extension Weather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weather> {
        return NSFetchRequest<Weather>(entityName: "Weather")
    }

    @NSManaged public var id: Double
    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var timezome: Double
    @NSManaged public var temp: Double
    @NSManaged public var tempMax: Double
    @NSManaged public var tempMin: Double
    @NSManaged public var main: String?
    @NSManaged public var desc: String?
    @NSManaged public var icon: String?

}
