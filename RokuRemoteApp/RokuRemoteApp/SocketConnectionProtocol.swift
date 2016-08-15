import Foundation

protocol SocketConnectionProtocol
{
    func openConnection<T>() -> T
    func closeConnection() -> Bool
}