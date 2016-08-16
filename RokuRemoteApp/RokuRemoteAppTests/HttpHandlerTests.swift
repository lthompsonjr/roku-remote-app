//
//  HttpHandlerTests.swift
//  RokuRemoteApp
//
//  Created by Thuringer, Nicholas (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import XCTest
import OHHTTPStubs

class HttpHandlerTests: XCTestCase, ResponseDelegate
{
    
    let ip: String = "http://192.168.2.4:8060"
    var handler: HttpHandler!
    var expectation: XCTestExpectation?

    override func setUp()
    {
        handler = HttpHandler(url: ip)
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetDeviceInfo()
    {
        let myString = "testData"
        let myNSString = myString as NSString
        let myNSData = myNSString.dataUsingEncoding(NSUTF8StringEncoding)!
        
        // Create stub of http response for getDeviceInfo()
        stub(isMethodGET() && isPath("/query/device-info"))
        { _ in
            return OHHTTPStubsResponse(
                data: myNSData,
                statusCode: 200,
                headers: .None
            )
        }
        
        expectation = self.expectationWithDescription("asynchronous request")
        
        handler.callGetInfoEndPoint(self)
        
        self.waitForExpectationsWithTimeout(10, handler: .None)
    }
    
    
    func testButtonPressed(buttonPressed: String)
    {
        let myString = "testData"
        let myNSString = myString as NSString
        let myNSData = myNSString.dataUsingEncoding(NSUTF8StringEncoding)!
        
        // Create stub of http response for getDeviceInfo()
        stub(isMethodPOST() && isPath(buttonPressed))
        { _ in
            return OHHTTPStubsResponse(
                data: myNSData,
                statusCode: 200,
                headers: .None
            )
        }
        
        expectation = self.expectationWithDescription("asynchronous request")
        
        handler.callButtonPressedEndPoint(buttonPressed, delegate: self)
        
        self.waitForExpectationsWithTimeout(10, handler: .None)
    }
    
    
    func testButtonPressedUp()
    {
        let getKeyUpEndPoint: String = "/keypress/Up"
        testButtonPressed(getKeyUpEndPoint)
    }
    
    func testButtonPressedDown()
    {
        let getKeyDownEndPoint: String = "/keypress/Down"
        testButtonPressed(getKeyDownEndPoint)
    }
    
    func testButtonPressedLeft()
    {
        let getKeyLeftEndPoint: String = "/keypress/Left"
        testButtonPressed(getKeyLeftEndPoint)
        
    }
    
    func testButtonPressedRight()
    {
        let getKeyRightEndPoint: String = "/keypress/Right"
        testButtonPressed(getKeyRightEndPoint)
    }
    
    func testButtonPressedSelect()
    {
        let getKeySelectEndPoint: String = "/keypress/Select"
        testButtonPressed(getKeySelectEndPoint)
    }
    
    func testButtonPressedBack()
    {
        let getKeyBackEndPoint: String = "/keypress/Back"
        testButtonPressed(getKeyBackEndPoint)
    }
    
    func testButtonPressedHome()
    {
        let getKeyHomeEndPoint: String = "/keypress/Home"
        testButtonPressed(getKeyHomeEndPoint)
    }
    
    
    func didReceiveXMLInfo(data: NSData)
    {
        let testString = NSString(data: data, encoding: NSUTF8StringEncoding)
        print(testString)
        XCTAssert(testString == "testData")
        expectation?.fulfill()
    }
    
    func didReceiveResponse(data: NSData)
    {
        let testString = NSString(data: data, encoding: NSUTF8StringEncoding)
        print(testString)
        XCTAssert(testString == "testData")
        expectation?.fulfill()
    }

    func testPerformanceExample()
    {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
