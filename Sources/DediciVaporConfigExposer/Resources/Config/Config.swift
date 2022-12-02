//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import DediciVaporToolbox
import Foundation
import Vapor

internal class Config {
    static let current: Config = .init()

    private let queue: DispatchQueue = .init(label: "Config")
    private(set) var items: JsonObject = [:]

    func set(_ value: JsonValue, forKey key: String) {
        queue.sync { items[key] = value.isNil ? nil : value }
    }
}
