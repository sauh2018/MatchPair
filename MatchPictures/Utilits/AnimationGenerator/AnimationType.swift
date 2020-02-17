//
//  AnimationType.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

enum AnimationType: CaseIterable {

    case splash
    case menuBackround

    var name: String {
        switch self {
        case .splash:
            return "splash_animation"
        case .menuBackround:
            return "menu_background"
        }
    }

    var extensionName: String {
        return "json"
    }

}
