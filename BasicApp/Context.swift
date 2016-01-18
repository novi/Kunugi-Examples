import Nest
import Kunugi
import Inquiline

class Context: ContextBox {
    var context: [ContextType] = []
    var request: Request
    
    var method: Method
    var path: String
    var parameters: [String: String] = [:]
	
    init(request: RequestType, method: Method) {
        self.request = Request(method: request.method, path: request.path, headers: request.headers, body: request.body)
        self.path = self.request.path
        self.method = method
    }
}