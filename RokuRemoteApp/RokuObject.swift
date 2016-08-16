//
//  RokuObject.swift
//  RokuRemoteApp
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation
import CoreData

@objc(RokuObject)
class RokuObject: NSManagedObject
{
    
    @NSManaged var ipAddress: String?
    @NSManaged var serialNumber: String?
    @NSManaged var boxName: String?
    @NSManaged var lastTimeConnected: NSDate?


// Insert code here to add functionality to your managed object subclass
    


}
