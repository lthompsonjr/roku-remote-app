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
    
    var mockManagedObjectContext: MockNSManagedObjectContext!
    
    override func setUp()
    {
        super.setUp()
        //Initialise the mock contect with private queue concurrency type to take it of the main thread
        mockManagedObjectContext = MockNSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetRokuObject()
    {
        //Setup
        let moc = mockManagedObjectContext.setUpInMemoryManagedObjectContext() as! MockNSManagedObjectContext
        let rokuDAO = RokuDeviceDAO(managedContext: moc)
        
        //Insert Some Test Object in the Mock Context
        let entity = NSEntityDescription.insertNewObjectForEntityForName("RokuDevice", inManagedObjectContext: moc)
            as! RokuDevice
        entity.deviceName = "Test Name"
        entity.ipAddress = "Test IP"
        entity.lastConnected = NSDate()
        entity.serialNumber = "ihdasuyig67g3873"
        
        //Test
        let fetchedDevice = rokuDAO.getDevice()
        
        //Assert
        XCTAssertEqual(entity, fetchedDevice)
        
    }
    
    func testSaveRokuObject()
    {
    
        //Setup
        let moc = mockManagedObjectContext.setUpInMemoryManagedObjectContext() as! MockNSManagedObjectContext
        let rokuDAO = RokuDeviceDAO(managedContext: moc)
        
        // Create Entity
        let entity = NSEntityDescription.entityForName("RokuDevice", inManagedObjectContext: moc)
        // Initialize Record
        let record = RokuDevice(entity: entity!, insertIntoManagedObjectContext: moc)
        record.deviceName = "Test name"
        record.serialNumber = "hkdagksgdahk"
        record.ipAddress = "Test IP"
        record.lastConnected = NSDate()
        
        //Test
        rokuDAO.saveDevice(record)
        
        //Assert
        XCTAssertEqual(record, moc.storedDevices.first)
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
