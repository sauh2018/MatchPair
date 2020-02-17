//
//  SplashConfigurator.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

final class SplashControllerConfigurator {

    class func configure(output: SplashViewModel.ModuleOutput) -> UIViewController {
        let model = SplashViewModel(output: output)
        let viewController = SplashViewController(model: model)
        return viewController
    }

}
