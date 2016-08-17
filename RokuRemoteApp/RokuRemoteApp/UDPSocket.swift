import Foundation
import CocoaAsyncSocket

public class UDPSocket : NSObject, SocketConnectionProtocol, GCDAsyncUdpSocketDelegate
{
    
    var udpSocket: GCDAsyncUdpSocket!
    
    /* isConnectionOpen
         Checks if udpSocket is not nil and returns true if being broadcast/is connected
    */
    func isConnectionOpen() -> Bool
    {
        if udpSocket != nil
        {
            return !udpSocket.isClosed();
        }
        
        return false
    }
    
    /* openConnection
        Closes any open connections and sends out a m-search broadcast to find all roku devices on the same network
        Prepares the socket for recieving data if the m-search is succesful
    */
    func openConnection()
    {
        if isConnectionOpen()
        {
            closeConnection()
        }
        
        let broadcastAddress: String = "239.255.255.250"
        let broadcastPort: UInt16 = 1900
        
        //m-search request URI for discovering roku devices in the network
        let mSearchString: NSData = "M-SEARCH * HTTP/1.1\r\nHOST: 239.255.255.250:1900\r\nMAN: \"ssdp:discover\"\r\nMX: 3\r\nST: roku:ecp\r\nUSER-AGENT: iOS UPnP/1.1 TestApp/1.0\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)!
        
        udpSocket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue());
        
        udpSocket.sendData(mSearchString, toHost: broadcastAddress, port: broadcastPort, withTimeout: 60, tag: 0)
        
        
        do{
            
            try udpSocket.bindToPort(broadcastPort)
            try udpSocket.joinMulticastGroup(broadcastAddress)
            try udpSocket.beginReceiving()
            
        }
        catch {
            print("No Connection Found")
        }

    }

    /* closeConnection
          Closes any open connections
    */
    
    func closeConnection()
    {
        if (udpSocket != nil || !udpSocket.isClosed())
        {
            udpSocket.close()
        }
    }
}
