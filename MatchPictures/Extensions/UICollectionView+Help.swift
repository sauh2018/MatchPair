//
//  UICollectionView+Help.swift
//  HealthMe
//
//  Created by Agilie on 19.11.2019.
//  Copyright © 2019 Declareme UG. All rights reserved.
//

import UIKit

extension UICollectionView {

    func registerNibReusable<T: UICollectionViewCell>(_ type: T.Type) {
        register(UINib(nibName: String(describing: T.self), bundle: nil),
                 forCellWithReuseIdentifier: String(describing: T.self))
    }

    func dequeueReusable<T>(type: T.Type, at indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: T.self),
                                   for: indexPath) as! T // swiftlint:disable:this force_cast
    }

}
