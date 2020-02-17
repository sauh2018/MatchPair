//
//  UILabel+Animation.swift
//  HealthMe
//
//  Created by Agilie on 05.12.2019.
//  Copyright © 2019 Declareme UG. All rights reserved.
//

import UIKit

extension UILabel {

    func changeTextWidthAnimation(to value: String?, duration: TimeInterval) {
        UIView.transition(with: self, duration: duration, options: [.transitionCrossDissolve], animations: { [weak self] in
            self?.text = value
        }, completion: nil)
    }

    func changeColorAnimated(to color: UIColor, duration: TimeInterval) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.textColor = color
        }
    }

}
