//
//  User+CoreDataProperties.swift
//  
//
//  Created by apple on 10/10/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int32

}
extension User : Identifiable {

}
