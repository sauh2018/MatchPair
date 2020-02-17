//
//  FirebasInteractor.swift
//  MatchPictures
//
//  Created by Денис on 14.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation
import FirebaseDatabase
import PromiseKit

final class FirebaseInteractor {

    struct Constants {
        static let configurationPath = "Configs"
    }

    private let ref: DatabaseReference

    // MARK: - Init/Deinit

    init(ref: DatabaseReference) {
        self.ref = ref
        observeAppConfiguration()
    }

    // MARK: - Logic

    private func observeAppConfiguration() {
        ref.child(Constants.configurationPath).observe(.childChanged, with: { _ in
            NotificationCenter.default.post(name: .didUpdateConfigurations, object: nil)
        })
    }

}

// MARK: - DataProvider

extension FirebaseInteractor: DataProvider {

    func getConfigurations() -> Promise<Configuration> {
        return Promise { resolver in
            ref.child(Constants.configurationPath).observe(.value) { snapShot in
                guard let value = snapShot.value else {
                    resolver.reject(CommonError(type: .dataNotExist).error)
                    return
                }

                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
                    let configurations = try JSONDecoder().decode(Configuration.self, from: jsonData)
                    resolver.fulfill(configurations)
                } catch {
                    resolver.reject(error)
                }
            }
        }
    }

}
