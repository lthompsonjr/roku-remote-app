//
//  DatabaseLayerTest.swift
//  RokuRemoteApp
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 16/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import XCTest
import CoreData
@testable import RokuRemoteApp

class DatabaseLayerTest: XCTestCase {
    
    
    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetRokuObject()
    {
        
        
    }
    
    func testSaveRokuObject()
    {
    
        //Setup
        
        var mockManagedObjectContext: MockNSManagedObjectContext = MockNSManagedObjectContext()
        var context = mockManagedObjectContext.setUpInMemoryManagedObjectContext()
        
        
        //var moc = AppDelegate().managedObjectContext
        
        
        let ipAddress = "crap"
        let deviceName = "more crap"
        let lastConnected = NSDate()
        let serialNumber = "even more crap"
       
        
        //Test
        var someObject = RokuDevice.insertRokuObjectInMockContext(context,ipAddress: ipAddress, deviceName: deviceName, lastConnected: lastConnected, serialNumber: serialNumber) as! RokuDevice
        //let fetchRequest = NSFetchRequest(entityName:"RokuDevice")
       
        //var fetchedObjects = try! moc.executeFetchRequest(fetchRequest) as! [RokuDevice]
        print("Original" + someObject.deviceName!)
       // print("The count" + (context.storedDevices.count))
        print("Mocked save" + ((context as! MockNSManagedObjectContext).storedDevices.first as! RokuDevice).deviceName!)
        
      
        //Assert
        XCTAssertEqual(someObject, (context as! MockNSManagedObjectContext).storedDevices.first)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
