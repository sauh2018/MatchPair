//
//  MenuConfigurator.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

final class MenuConfigurator {

    class func configure(output: MenuModel.ModuleOutput) -> UIViewController {
        let model = MenuModel(output: output)
        let viewController = MenuViewController(model: model)
        return viewController
    }

}
