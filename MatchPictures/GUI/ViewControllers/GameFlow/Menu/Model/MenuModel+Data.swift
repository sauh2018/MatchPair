//
//  MenuModel+Data.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

extension MenuModel {

    enum ModuleOutputAction {
        case playGame
    }

    struct ModuleOutput {
        let action: (ModuleOutputAction) -> Void
    }

}
