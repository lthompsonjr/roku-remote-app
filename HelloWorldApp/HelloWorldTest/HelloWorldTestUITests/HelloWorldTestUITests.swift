//
//  HelloWorldTestUITests.swift
//  HelloWorldTestUITests
//
//  Created by Simeonov, Ivan (Associate Software Developer) on 08/08/2016.
//  Copyright © 2016 Simeonov, Ivan (Associate Software Developer). All rights reserved.
//

import XCTest

class HelloWorldTestUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHelloWorld() {
    
        XCTAssert(app.staticTexts["sup?"].exists)
        XCTAssert(app.buttons["Click Me"].exists)
        
        app.buttons["Click Me"].tap()
        app.tap()
        XCTAssert(app.staticTexts["Hello World"].exists)
    }
}
