//
//  RokuDevice+CoreDataProperties.swift
//  RokuRemoteApp
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 16/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension RokuDevice {

    @NSManaged var deviceName: String?
    @NSManaged var ipAddress: String?
    @NSManaged var lastConnected: NSDate?
    @NSManaged var serialNumber: String?

    
}
