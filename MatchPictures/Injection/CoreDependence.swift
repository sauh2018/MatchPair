//
//  CoreDependence.swift
//  MatchPictures
//
//  Created by Денис on 14.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit
import FirebaseDatabase

final class CoreDependence { }

// MARK: - DependenceProviders
extension CoreDependence: DependenceProviders {

    func execute() {
        let firebaseInteractor = FirebaseInteractor(ref: Database.database().reference())
        registerService(service: firebaseInteractor)

        let userDefaultsMediator = UserDefaultsMediator(userDefaults: .standard)
        registerService(service: userDefaultsMediator)

        let localInteractorDependencies = LocalInteractor.Dependencies(userDefaults: userDefaultsMediator)
        let localInteractor = LocalInteractor(dependencies: localInteractorDependencies)
        registerService(service: localInteractor)

        let configurationRepositoryDependencies = ConfigurationRepository.Dependencies(firebaseInteractor: firebaseInteractor,
                                                                           localInteractor: localInteractor)
        let configurationRepository = ConfigurationRepository(dependencies: configurationRepositoryDependencies)
        registerService(service: configurationRepository)
    }

}
