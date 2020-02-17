//
//  UINavigationController+Orientation.swift
//  MatchPictures
//
//  Created by Денис on 17.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

extension UINavigationController {

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? [.all]
    }

}
