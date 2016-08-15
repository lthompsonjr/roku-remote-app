//
//  DatabaseTesting.swift
//  RokuRemoteApp
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import XCTest

class DatabaseTesting: XCTestCase {
    

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSaveRokuObjectFunction()
    {
        //Set up
        var databaseConnector: StubDatabaseConnector = StubDatabaseConnector()
        var rokuObject: RokuObject = RokuObject()
//        rokuObject.boxName = 'hello world'
    
        //test
        databaseConnector.saveRokuObject(rokuObject)
        
        
        //Assert
      //XCTAssertNotNil(databaseConnector.rokuObject)
        XCTAssertEqual(rokuObject, databaseConnector.rokuObject)
        
        
        
    }
    
    func testGetRokuObject()
    {
        
    }

}
