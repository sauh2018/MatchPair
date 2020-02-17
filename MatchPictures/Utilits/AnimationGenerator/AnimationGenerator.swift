//
//  AnimationGenerator.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation
import Lottie

final class AnamationGenerator {

    static func make(_ type: AnimationType) -> Animation? {
        guard let path = Bundle.main.path(forResource: type.name, ofType: type.extensionName) else {
            return nil
        }

        return Animation.filepath(path)
    }

}
