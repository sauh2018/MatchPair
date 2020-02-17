//
//  MatchPairGame.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

class Card {

    let imageName: String
    var isMatched: Bool = false
    var isFliped: Bool = false

    var image: UIImage {
        return  UIImage(named: imageName)!
    }

    // MARK: - Init/Deinit

    init(imageName: String) {
        self.imageName = imageName
    }

    // MARK: - Logic

    static var uniqCards: [Card] {
        return ["img_1", "img_2", "img_3"].map({ Card(imageName: $0) })
    }

    func copy() -> Card {
        let copyItem = Card(imageName: imageName)
        return copyItem
    }

}

// MARK: - Equatable
extension Card: Equatable {

    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.imageName == rhs.imageName
    }

}

protocol MatchGameDelegate: class {
    func hideAllNotMatchedCards()
    func didEndGame()
}

final class MatchPairGame {

    var items: [Card]
    private var previosSelectedItem: Card?

    weak var delegate: MatchGameDelegate?

    var allCardsMatched: Bool {
        return items.filter({ !$0.isMatched }).isEmpty
    }

    // MARK: - Init/Deinit

    init(uniqCards: [Card]) {
        items = (uniqCards + uniqCards.map({ $0.copy()})).shuffled()
    }

    // MARK: - Logic

    func selectItem(at position: Int) {
        let selectedItem = items[position]
        selectedItem.isFliped = true

        if let previosSelectedItem = previosSelectedItem {
            if previosSelectedItem == selectedItem {
                [previosSelectedItem, selectedItem].forEach({ $0.isMatched = true })
            } else {
                delegate?.hideAllNotMatchedCards()
            }

            self.previosSelectedItem = nil
        } else {
            previosSelectedItem = selectedItem
        }

        if allCardsMatched {
            delegate?.didEndGame()
        }
    }

    func startNewGame() {
        items.forEach({ $0.isMatched = false; $0.isFliped = false })
        items.shuffle()
    }

}
