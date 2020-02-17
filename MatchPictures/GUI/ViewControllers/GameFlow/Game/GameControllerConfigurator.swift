//
//  GameControllerConfigurator.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

final class GameControllerConfigurator {

    class func configure(output: GameViewModel.ModuleOutput) -> UIViewController {
        let game = MatchPairGame(uniqCards: Card.uniqCards)
        let input = GameViewModel.ModuleInput(game: game)
        let model = GameViewModel(output: output, input: input)
        let viewController = GameViewController(model: model)

        game.delegate = viewController

        return viewController
    }

}
