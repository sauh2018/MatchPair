//
//  UIView + Activity.swift
//  HealthMe
//
//  Created by Agilie on 29.11.2019.
//  Copyright © 2019 Declareme UG. All rights reserved.
//

import UIKit

extension UIView {

    func showActivityIndicator(style: UIActivityIndicatorView.Style = .gray) {
        removeActivityIndicator()

        let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: style)
        activityIndicatorView.frame = bounds
        activityIndicatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        activityIndicatorView.isUserInteractionEnabled = false

        self.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }

    func removeActivityIndicator() {
        if let activityIndicator: UIView = self.subviews.first(where: { $0 is UIActivityIndicatorView }) {
            activityIndicator.removeFromSuperview()
        }
    }

}
