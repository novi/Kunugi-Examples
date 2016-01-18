import Nest
import Kunugi
import Inquiline

let app = App()


// Closure style handler with routes
let router = Router()
router.get("/hello") { ctx in
    return .Respond(Response(.Ok, body: "world"))
}

// Controller style handler
struct HelloController: ControllerMiddleware, AnyRequestHandleable {
    func get(ctx: ContextBox) throws -> MiddlewareResult {
        return .Respond(Response(.Ok, body: "hello swift world"))
    }
}


app.use(router)
app.use( Route("/helloworld", HelloController()) )


serve(3000, app.application)