//
//  SplashViewModel+Data.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

extension SplashViewModel {

    enum ModuleOutputAction {
        case presentAdvertasingFlow
        case presentGameFlow
    }

    struct ModuleOutput {
        let action: (ModuleOutputAction) -> Void
    }

}
