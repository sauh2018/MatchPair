//
//  ConfigurationRepository.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation
import PromiseKit

enum FetchType {
    case remote
    case local
}

final class ConfigurationRepository {

    struct Dependencies {
        let firebaseInteractor: FirebaseInteractor
        let localInteractor: LocalInteractor
    }

    private let dependencies: Dependencies

    // MARK: - Init/Deinit
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Logic

    func fetch(with type: FetchType) -> Promise<Configuration> {
        switch type {
        case .local:
            return dependencies.localInteractor.getConfigurations()
        case .remote:
            return fetchObject()
        }
    }

}

// MARK: - Repository

extension ConfigurationRepository: Repository {

    typealias ObjectType = Configuration

    func fetchObject() -> Promise<Configuration> {
        return Promise { resolver in
            dependencies.firebaseInteractor.getConfigurations()
                .done { result in resolver.fulfill(result) }
                .catch { [weak self] _ in
                    self?.dependencies.localInteractor.getConfigurations()
                        .done { result in resolver.fulfill(result) }
                        .cauterize()
            }
        }
    }

}
