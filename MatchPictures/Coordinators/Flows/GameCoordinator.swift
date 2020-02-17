//
//  GameFlowCoordinator.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

class GameCoordinator: NavigationCoordinator {

    override func start() {
        container.setNavigationBarHidden(true, animated: false)
        presentMenu()
    }

    // MARK: - Logic

    private func presentMenu() {
        let menuVC = MenuConfigurator.configure(output: MenuModel.ModuleOutput(action: { [weak self] actionType in
            switch actionType {
            case .playGame:
                self?.startNewGame()
            }
        }))

        set([menuVC])
    }

    private func startNewGame() {
        let gameVC = GameControllerConfigurator.configure(output: GameViewModel.ModuleOutput(action: { [weak self] actionType in
            switch actionType {
            case .openMenu:
                self?.pop()
            }
        }))

        push(gameVC)
    }

}
