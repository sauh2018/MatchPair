//
//  MenuModel.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

final class MenuModel {

    private let output: ModuleOutput

    // MARK: - Init/Deinit

    init(output: ModuleOutput) {
        self.output = output
    }

}

// MARK: - MenuModelProtcol

extension MenuModel: MenuModelProtcol {

    func openGame() {
        output.action(.playGame)
    }

}
