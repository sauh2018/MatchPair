//
//  UIViewController+Help.swift
//  HealthMe
//
//  Created by Agilie on 05.12.2019.
//  Copyright © 2019 Declareme UG. All rights reserved.
//

import UIKit

extension UIViewController {

    func updateStatusBar() {
        setNeedsStatusBarAppearanceUpdate()
    }

    static func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController: UINavigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }

        if let tabController: UITabBarController = controller as? UITabBarController {
            if let selected: UIViewController = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }

        if let presented: UIViewController = controller?.presentedViewController {
            return topViewController(controller: presented)
        }

        return controller
    }

}
