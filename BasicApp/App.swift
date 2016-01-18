import Nest
import Kunugi
import Inquiline

class App: AppType {
	
    var wrap: [WrapMiddleware] = []
    var middleware: [MiddlewareType] = []
    
    func use(m: WrapMiddleware) {
        wrap.append(m)
    }
    
    func use(m: MiddlewareType) {
        middleware.append(m)
    }
    
    func catchError(e: ErrorType) {
        print("internal server error: \(e)")
    }
    
    var application: Application {
        let handler = self.handler
        return { request in
            guard let method = Method(rawValue: request.method) else {
                return Response(.MethodNotAllowed)
            }
            do {
                switch try handler.handleIfNeeded(Context(request: request, method: method)) {
                case .Next:
                    return Response(.NotFound)
                case .Respond(let res):
                    return res
                }
            } catch(let e) {
                self.catchError(e)
                return Response(.InternalServerError)
            }
        }
    }
}