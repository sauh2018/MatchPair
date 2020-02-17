//
//  ServiceLocator.swift
//  MatchPictures
//
//  Created by Денис on 14.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

final class ServiceLocator {

    static let shared = ServiceLocator()

    private var registry: [String: Any] = [:]

    // MARK: - Init/Deinit

    private init() { }

    // MARK: - Logic

    private func typeName(some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }

    func getService<T>() -> T {
        return tryGetService()!
    }

    func tryGetService<T>() -> T? {
        let key = typeName(some: T.self)
        return registry[key] as? T
    }

    func unRegisterService<T>(service: T) {
        let key = typeName(some: T.self)
        registry.removeValue(forKey: key)
    }

    func registerService<T>(service: T) {
        let key = typeName(some: T.self)
        registry[key] = service
    }

}
