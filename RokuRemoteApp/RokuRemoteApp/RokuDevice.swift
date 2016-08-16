//
//  RokuDevice.swift
//  RokuRemoteApp
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 16/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation
import CoreData


class RokuDevice: NSManagedObject {

 //Insert code here to add functionality to your managed object subclass
    
    class func insertRokuObjectInContext(context: NSManagedObjectContext, ipAddress: String, deviceName: String, lastConnected: NSDate, serialNumber: String ) -> AnyObject
    {
        let newRokuDevice = NSEntityDescription.insertNewObjectForEntityForName("RokuDevice", inManagedObjectContext:context) as! RokuDevice
        newRokuDevice.deviceName = deviceName
        newRokuDevice.ipAddress = ipAddress
        newRokuDevice.lastConnected = lastConnected
        newRokuDevice.serialNumber = serialNumber
        
        return newRokuDevice
    }

    class func insertRokuObjectInMockContext(context: NSManagedObjectContext, ipAddress: String, deviceName: String, lastConnected: NSDate, serialNumber: String ) -> AnyObject
    {
        let newRokuDevice = NSEntityDescription.insertNewObjectForEntityForName("RokuDevice", inManagedObjectContext:context) as! RokuDevice
        newRokuDevice.deviceName = deviceName
        newRokuDevice.ipAddress = ipAddress
        newRokuDevice.lastConnected = lastConnected
        newRokuDevice.serialNumber = serialNumber
    
        context.insertObject(newRokuDevice)
        return newRokuDevice
    }
    

}
