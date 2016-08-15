import XCTest

class SocketConnectionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let UDPSocket = UDPSocketConnection()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testUdpOpenConnection()
    {
        let UdpSocket = UDPSocket.openConnection()
        //XCTAssertTrue(UdpSocket as? [GCDAsyncUdpSocket])
        XCTAssertNotNil(UdpSocket)
    }
    
}
