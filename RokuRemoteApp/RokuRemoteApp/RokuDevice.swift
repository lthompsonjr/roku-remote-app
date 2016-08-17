//
//  RokuDevice.swift
//  RokuRemoteApp
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 16/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation
import CoreData


class RokuDevice: NSManagedObject
{
    @NSManaged var deviceName: String?
    @NSManaged var ipAddress: String?
    @NSManaged var lastConnected: NSDate?
    @NSManaged var serialNumber: String?
}
