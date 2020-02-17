//
//  WebViewModel+Data.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

extension WebViewModel {

    enum ModuleOutputAction {
    }

    struct ModuleInput {
        let urlPath: String
    }

    struct ModuleOutput {
        let action: (ModuleOutputAction) -> Void
    }

}
