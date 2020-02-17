//
//  SplashViewModelProtocol.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

protocol SplashViewModelProtocol {
    var isDataLoaded: Bool { get }
    func loadConfigurations()
    func moveToNextVC()
}
