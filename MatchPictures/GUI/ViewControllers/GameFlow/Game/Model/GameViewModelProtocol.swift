//
//  GameViewModelProtocol.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

protocol GameViewModelProtocol {
    var itemsCount: Int { get }
    func canSelectItem(at position: Int) -> Bool
    func item(at position: Int) -> Card
    func openMenu()
    func repeatGame()
    func chooseItem(at position: Int)
}
