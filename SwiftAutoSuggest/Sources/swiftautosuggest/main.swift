import Kitura
import Foundation
let router = Router()

AutoSuggestService.initialize()

router.get("/autosuggest") { request, response, next in
  guard let prefix = request.queryParameters["prefix"] else {
    try response.status(.badRequest).end()
    return
  }
  let result = AutoSuggestService.getResult(for: prefix)
  response.send(result)
}

Kitura.addHTTPServer(onPort: 8090, with: router)

Kitura.run()
