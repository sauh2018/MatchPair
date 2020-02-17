//
//  LocalInteractor.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation
import PromiseKit

final class LocalInteractor {

    struct Dependencies {
        let userDefaults: UserDefaultsMediator
    }

    private let dependencies: Dependencies

    // MARK: - Init/Deinit

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

}

// MARK: - DataProvider

extension LocalInteractor: DataProvider {

    func getConfigurations() -> Promise<Configuration> {
        return Promise { resolver in
            let isAdvertisingOn = dependencies.userDefaults.bool(for: .isAdvertisingOn)
            let webPageURL = dependencies.userDefaults.string(for: .webPageUrl)

            if let configuration = Configuration(isAdvertisingOn: isAdvertisingOn, webPageURL: webPageURL) {
                resolver.fulfill(configuration)
            } else {
                resolver.fulfill(Configuration.makeDefault())
            }
        }
    }

}
