import Foundation

class SocketFactory
{
   func getUdpSocket() -> SocketConnectionProtocol
    {
    
        return UDPSocket();
    }
}