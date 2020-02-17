//
//  GameViewModel.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

final class GameViewModel {

    private let output: ModuleOutput
    private var input: ModuleInput

    // MARK: - Init/Deinit
    init(output: ModuleOutput, input: ModuleInput) {
        self.output = output
        self.input = input
    }

}

// MARK: - GameViewModelProtocol

extension GameViewModel: GameViewModelProtocol {

    func canSelectItem(at position: Int) -> Bool {
        return !input.game.items[position].isFliped
    }

    var itemsCount: Int {
        return input.game.items.count
    }

    func item(at position: Int) -> Card {
        return input.game.items[position]
    }

    func openMenu() {
        output.action(.openMenu)
    }

    func repeatGame() {
        input.game.startNewGame()
    }

    func chooseItem(at position: Int) {
        input.game.selectItem(at: position)
    }

}
