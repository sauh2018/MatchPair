//
//  GameViewModel+Data.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

extension GameViewModel {

    enum ModuleOutputAction {
        case openMenu
    }

    struct ModuleInput {
        var game: MatchPairGame
    }

    struct ModuleOutput {
        let action: (ModuleOutputAction) -> Void
    }

}
