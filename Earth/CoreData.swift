//
//  CoreData.swift
//  Earth
//
//  Created by Vojtěch Šebek on 06.09.16.
//  Copyright © 2016 Vojtěch Šebek. All rights reserved.
//

import Foundation
import UIKit
import CoreData


func deleteIncidents(entity: String) {
    let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDel.managedObjectContext
    let coord = appDel.persistentStoreCoordinator
    
    let fetchRequest = NSFetchRequest(entityName: entity)
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    
    do {
        try coord.executeRequest(deleteRequest, withContext: context)
    } catch let error as NSError {
        debugPrint(error)
    }
}

// ---------------------------------------------------------------------------------

func loadData(entityName: String) -> [NSManagedObject] {
    let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDel.managedObjectContext

    let request = NSFetchRequest(entityName: entityName)
    
    do {
        let results = try context.executeFetchRequest(request)
        let target = results as! [NSManagedObject]
        
        return target
        
    } catch {
        fatalError("Error in retreiving from CoreData")
    }
}
