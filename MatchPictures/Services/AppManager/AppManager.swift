//
//  AppManager.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation
import PromiseKit

final class AppManager {

    struct Dependencies {
        let repo: ConfigurationRepository
        let userDefaultsMediator: UserDefaultsMediator
    }

    static let shared: AppManager = {
        let dependencies = Dependencies(repo: inject(), userDefaultsMediator: inject())
        return AppManager(dependencies: dependencies)
    }()

    private let dependencies: Dependencies
    var configuration = Configuration.makeDefault()

    var appCoordinator: AppCoordinator? {
        return (UIApplication.shared.delegate as? AppDelegate)?.appCoordinator
    }

    // MARK: - Init/Deinit

    private init(dependencies: Dependencies) {
        self.dependencies = dependencies
        registerNotifications()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Public

    func loadData() -> Promise<Void> {
        return Promise { resolver in
            dependencies.repo.fetch(with: .remote)
                .done { [weak self] result in
                    self?.configuration = result
                    resolver.fulfill_()
                } .catch { _ in  }
                .finally { resolver.fulfill_() }
        }
    }

    // MARK: - Private

    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFlow), name: .didUpdateConfigurations, object: nil)
    }

    @objc private func updateFlow() {
        appCoordinator?.start()
    }

}
