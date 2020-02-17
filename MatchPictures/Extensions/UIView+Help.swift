//
//  UIView+Help.swift
//  HealthMe
//
//  Created by Agilie on 18.11.2019.
//  Copyright © 2019 Declareme UG. All rights reserved.
//

import UIKit

protocol UIViewLoading { }

extension UIViewLoading where Self: UIView {

    static func loadFromNib(nibNameOrNil: String? = nil) -> Self {
        let result: Self = Bundle.main.loadNibNamed(String(describing: self),
                                                    owner: self,
                                                    options: nil)?.last as! Self // swiftlint:disable:this force_cast
        return result
    }

}

extension UIView: UIViewLoading { }

extension UIView {
    func rounded() {
        layer.cornerRadius = frame.height / 2.0
    }
}
