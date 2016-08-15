//
//  HttpHandlerTests.swift
//  RokuRemoteApp
//
//  Created by Thuringer, Nicholas (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import XCTest
import OHHTTPStubs

class HttpHandlerTests: XCTestCase
{
    
    let ip: String = "http://192.168.2.4"
    let session = MockURLSession()
    var handler: HttpHandler!

    override func setUp()
    {
        handler = HttpHandler(session: session,url: ip)
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
//    
//    func testGetDeviceInfo()
//    {
//        // Create stub of http response for getDeviceInfo()
//        stub(isHost(ip) && isPath("/query/device-info"))
//        { _ in
//            return OHHTTPStubsResponse(
//                data: NSData(),
//                statusCode: 200,
//                headers: .None
//            )
//        }
//        
//        // Get device info
//        handler.getDeviceInfo() { status in
//            
//            // Assert
//            XCTAssertEqual(status?, 200)
//            
//            expectation.fulfill()
//        }
//        
//        self.waitForExpectationsWithTimeout(1, handler: .None)
//        
//        OHHTTPStubs.removeAllStubs()
//    }
    
    func test_GET_StartsTheRequest() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        
        handler.get(NSURL()) { (_, _) -> Void in }
        
        XCTAssert(dataTask.resumeWasCalled)
    }

    func testPerformanceExample()
    {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
