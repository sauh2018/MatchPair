//
//  UserDefaultsMediator.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

final class UserDefaultsMediator {

    enum PropertyName: String {
        case isAdvertisingOn
        case webPageUrl
    }

    private let userDefaults: UserDefaults

    // MARK: - Init/Deinit

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    // MARK: - Actions

    func bool(for property: PropertyName) -> Bool {
        return userDefaults.bool(forKey: property.rawValue)
    }

    func string(for property: PropertyName) -> String? {
        return userDefaults.string(forKey: property.rawValue)
    }

    func save(value: String, for property: PropertyName) {
        userDefaults.set(value, forKey: property.rawValue)
    }

    func save(value: Bool, for property: PropertyName) {
        userDefaults.set(value, forKey: property.rawValue)
    }

}
