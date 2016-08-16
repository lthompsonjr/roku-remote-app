import Foundation
import CocoaAsyncSocket

public class UDPSocket : NSObject, SocketConnectionProtocol, GCDAsyncUdpSocketDelegate
{
    
    var mySocket: GCDAsyncUdpSocket!

    
    func isConnectionOpen() -> Bool
    {
        if mySocket != nil
        {
            return !mySocket.isClosed();

        }
        print("No Socket")
        return false
    }
    
    
    func openConnection()
    {
       
        if isConnectionOpen()
        {
            closeConnection()
        }
        
        let broadcastAddress: String = "239.255.255.250"
        let broadcastPort:UInt16 = 1900
        
        //DO something
        let mSearchString: NSData = "M-SEARCH * HTTP/1.1\r\nHOST: 239.255.255.250:1900\r\nMAN: \"ssdp:discover\"\r\nMX: 3\r\nST: roku:ecp\r\nUSER-AGENT: iOS UPnP/1.1 TestApp/1.0\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)!
        
        mySocket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue());
        
        mySocket.sendData(mSearchString, toHost: broadcastAddress, port: broadcastPort, withTimeout: 60, tag: 0)
        
        
        do{
            try mySocket.bindToPort(broadcastPort)
            try mySocket.joinMulticastGroup(broadcastAddress)
            try mySocket.beginReceiving()
        }
        catch {
            print("I failed!!")
        }

    }

    
    func closeConnection()
    {
        if (mySocket != nil || !mySocket.isClosed())
        {
            mySocket.close()
        }
    }
    
}
