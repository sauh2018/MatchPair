//
//  Loadable.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

protocol Loadable {
    func startLoading()
    func stopLoading()
}

extension Loadable where Self: UIViewController {

    func startLoading() {
        view.showActivityIndicator()
    }

    func stopLoading() {
        view.removeActivityIndicator()
    }

}
