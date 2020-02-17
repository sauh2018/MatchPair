//
//  CommonError.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

enum ErorType {

    case noLocalConfiguration
    case dataNotExist

    var messageText: String {
        switch self {
        case .noLocalConfiguration:
            return "Failed to load local configuration"
        case .dataNotExist:
            return "Data is not exist"
        }
    }
}

struct CommonError {

    let error: Error

    // MARK: - Init/Deinit

    init(text: String) {
        self.error = NSError(domain: text, code: 0, userInfo: [:])
    }

    init(type: ErorType) {
        self = CommonError(text: type.messageText)
    }

}
