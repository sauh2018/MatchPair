//
//  UILayer+Help.swift
//  HealthMe
//
//  Created by Agilie on 20.10.2019.
//  Copyright © 2019 Declareme UG. All rights reserved.
//

import UIKit

extension CALayer {

    func addShadow(height: CGFloat = 2,
                   width: CGFloat = 0,
                   color: UIColor = #colorLiteral(red: 0.1137254902, green: 0.1490196078, blue: 0.1411764706, alpha: 1),
                   opacity: Float = 0.12,
                   radius: CGFloat = 2) {

        shadowOffset = CGSize(width: width, height: height)
        shadowColor = color.cgColor
        shadowOpacity = opacity
        shadowRadius = radius
    }

}
