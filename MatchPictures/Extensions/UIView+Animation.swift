//
//  UIView+Animation.swift
//  HealthMe
//
//  Created by Agilie on 05.12.2019.
//  Copyright © 2019 Declareme UG. All rights reserved.
//

import UIKit

extension UIView {

    @objc func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 5, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 5, y: center.y))
        layer.add(animation, forKey: "position")
    }

    func animateBorderColor(toColor: UIColor, duration: Double) {
      let animation: CABasicAnimation = CABasicAnimation(keyPath: "borderColor")
      animation.fromValue = layer.borderColor
      animation.toValue = toColor.cgColor
      animation.duration = duration
      layer.add(animation, forKey: "borderColor")
      layer.borderColor = toColor.cgColor
    }

    func bounce() {
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.transform = .identity
            }
        })
    }

}
