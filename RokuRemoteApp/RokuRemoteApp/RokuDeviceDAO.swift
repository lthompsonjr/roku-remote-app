//
//  RokuDeviceDAO.swift
//  RokuRemoteApp
//
//  Created by Simeonov, Ivan (Associate Software Developer) on 17/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation
import CoreData

public class RokuDeviceDAO
{
    
    var managedContext: NSManagedObjectContext
    
    init(managedContext: NSManagedObjectContext)
    {
        self.managedContext = managedContext
    }
    
    func getDevice() -> RokuDevice
    {
        let fetchRequest = NSFetchRequest(entityName: "RokuDevice")
        var result: RokuDevice!
        do
        {
            let resultsSet = try managedContext.executeFetchRequest(fetchRequest) as! [RokuDevice]
            result = resultsSet.first!
        } catch let error as NSError {
            print("Fetching RokuDevice error : \(error) \(error.userInfo)")
        }
        return result
    }
    
    func saveDevice(rokuDevice: RokuDevice) -> Bool
    {
        let entity = NSEntityDescription.insertNewObjectForEntityForName("RokuDevice", inManagedObjectContext:managedContext)
            as! RokuDevice
        entity.deviceName = rokuDevice.deviceName
        entity.ipAddress = rokuDevice.ipAddress
        entity.lastConnected = rokuDevice.lastConnected
        entity.serialNumber = rokuDevice.serialNumber
        return true
    }
    
    
}