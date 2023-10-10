//
//  FavWeather+CoreDataProperties.swift
//  
//
//  Created by apple on 10/10/23.
//
//

import Foundation
import CoreData


extension FavWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavWeather> {
        return NSFetchRequest<FavWeather>(entityName: "FavWeather")
    }

    @NSManaged public var city: String?
    @NSManaged public var id: UUID?

}
