//
//  MockNSManagedObjectContext.swift
//  RokuRemoteApp
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 16/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation
import CoreData
@testable import RokuRemoteApp

class MockNSManagedObjectContext: NSManagedObjectContext
{
    var storedDevices = [NSManagedObject]()
    
    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
    let modelURL = NSBundle.mainBundle().URLForResource("RokuRemoteApp", withExtension: "momd")
    guard let mom = NSManagedObjectModel(contentsOfURL: modelURL!) else {
        fatalError("Error initializing mom from: \(modelURL)")
    }
    //let managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle.mainBundle()])!
    
    let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: mom)
    
    do {
    try persistentStoreCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
    } catch {
    print("Adding in-memory persistent store failed")
    }
    
    let managedObjectContext = MockNSManagedObjectContext()
    managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    
    return managedObjectContext
    }
    
    override func executeFetchRequest(request: NSFetchRequest) throws -> [AnyObject]
    {
        return storedDevices
    }

    override func insertObject(object: NSManagedObject)
    {
        print((object as! RokuDevice).deviceName)
        storedDevices.append(object)
    }
    
}