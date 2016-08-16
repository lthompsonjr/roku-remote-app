import Foundation
import CocoaAsyncSocket

protocol SocketConnectionProtocol
{
    func openConnection()
    func closeConnection()
    func isConnectionOpen() -> Bool

}