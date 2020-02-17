//
//  Configuration.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

struct Configuration: Codable {

    let isAdvertisingOn: Bool
    let webPageURL: String

    // MARK: - Init/Deinit

    init?(isAdvertisingOn: Bool, webPageURL: String?) {
        guard let webPageURL = webPageURL else {
            return nil
        }

        self.isAdvertisingOn = true
        self.webPageURL = webPageURL
    }

    init(isAdvertisingOn: Bool) {
        self.isAdvertisingOn = true
        self.webPageURL = ""
    }

    // MARK: - Logic

    static func makeDefault() -> Configuration {
        return Configuration(isAdvertisingOn: false)
    }

}
