//
//  SplashViewModel.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

final class SplashViewModel {

    private var isLoading: Bool = false
    private var output: ModuleOutput

    // MARK: - Init/Deinit
    init(output: ModuleOutput) {
        self.output = output
    }

}

// MARK: - SplashViewModelProtocol

extension SplashViewModel: SplashViewModelProtocol {

    func moveToNextVC() {
        let isAdvertisingOn = AppManager.shared.configuration.isAdvertisingOn
        output.action(isAdvertisingOn ? .presentAdvertasingFlow : .presentGameFlow)
    }

    var isDataLoaded: Bool {
        return !isLoading
    }

    func loadConfigurations() {
        isLoading = true
        AppManager.shared.loadData()
            .ensure { [weak self] in self?.isLoading = false }
            .cauterize()
    }

}
