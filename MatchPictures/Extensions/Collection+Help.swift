//
//  Collection+Help.swift
//  HealthMe
//
//  Created by Agilie on 18.11.2019.
//  Copyright © 2019 Declareme UG. All rights reserved.
//

import Foundation

extension Collection {

    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

}
