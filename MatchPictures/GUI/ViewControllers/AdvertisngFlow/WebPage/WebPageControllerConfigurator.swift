//
//  WebPageControllerConfigurator.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

final class WebPageControllerConfigurator {

    class func configure(data: WebViewModel.ModuleInput) -> UIViewController {
        let model = WebViewModel(moduleInput: data)
        let viewController: WebViewViewController = WebViewViewController(model: model)
        return viewController
    }

}
