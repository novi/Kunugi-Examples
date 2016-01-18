import Nest
import Kunugi
import Inquiline

class Context: ContextBox {
    var context: [ContextType] = []
    var request: Request
    
	var path: String
    var parameters: [String: String] = [:]
	var method: Kunugi.Method
	
    init(request: RequestType) {
        self.request = Request(method: request.method, path: request.path, headers: request.headers, body: request.body)
        self.path = self.request.path
        self.method = Kunugi.Method(rawValue: request.method) ?? Kunugi.Method.OPTIONS
    }
}