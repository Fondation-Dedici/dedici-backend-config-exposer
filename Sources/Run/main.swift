//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import DediciVaporConfigExposer
import Vapor

internal var env = try Environment.detect()
internal let app = Application(env)

// Setting up the logging system is kind of tricky for now. See: https://github.com/vapor/vapor/issues/2429
try LoggingSystem.bootstrap(from: &env)
app.logger = .init(label: app.logger.label)

defer { app.shutdown() }
try app.configure()
try app.run()
