import http4swift
import Nest
import Inquiline

public func serve(port: UInt16, _ app: Application) {
    let addr = SocketAddress(port: port)
    guard let sock = Socket() else {
        return
    }
    guard let server = HTTPServer(socket: sock, addr: addr) else {
        return
    }
    server.serve(app)
}
