//
//  Blog+CoreDataProperties.swift
//  Earth
//
//  Created by Vojtěch Šebek on 06.09.16.
//  Copyright © 2016 Vojtěch Šebek. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Blog {

    @NSManaged var titlePost: String?
    @NSManaged var idBlog: String?
    @NSManaged var partTextBlog: String?
    @NSManaged var textBlog: String?

}
