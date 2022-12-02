//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import DediciVaporToolbox
import Foundation
import Vapor

internal struct ConfigController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let config = routes
        config.patch("update-config", use: patchConfig)
        config.get("config", use: readConfig)
    }

    func patchConfig(from request: Request) throws -> EventLoopFuture<Response> {
        let body = try request.content.decode(JsonObject.self)
        body.map { ($1, $0) }.forEach(Config.current.set)
        return request.eventLoop.makeSucceededFuture(Response(status: .noContent))
    }

    func readConfig(from request: Request) -> EventLoopFuture<JsonObject> {
        request.eventLoop.makeSucceededFuture(Config.current.items)
    }
}
