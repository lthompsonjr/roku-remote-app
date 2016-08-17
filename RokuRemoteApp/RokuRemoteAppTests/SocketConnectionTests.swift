import XCTest
import CocoaAsyncSocket

class SocketConnectionTests: XCTestCase {
    
    let socketFactory = SocketFactory()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsConnectionOpen()
    {
        
    }
    
    func testOpenUdpConnection()
    {
        let udpSocket = socketFactory.getUdpSocket()
        udpSocket.openConnection()
        XCTAssertTrue(udpSocket.isConnectionOpen())
        udpSocket.closeConnection();
    }
    
    func testCloseUdpConnection()
    {
        let udpSocket = socketFactory.getUdpSocket()
        udpSocket.openConnection()
        udpSocket.closeConnection();
        XCTAssertFalse(udpSocket.isConnectionOpen())
    }
}
