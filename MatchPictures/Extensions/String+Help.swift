//
//  String+Help.swift
//  HealthMe
//
//  Created by Agilie on 03.12.2019.
//  Copyright © 2019 Declareme UG. All rights reserved.
//

import UIKit

extension String {

    var url: URL? {
        return URL(string: self)
    }

    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintSize: CGSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox: CGRect = self.boundingRect(with: constraintSize, options: .usesLineFragmentOrigin,
                                                    attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }

    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

    func camelCaseToWords() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                return ($0 + " " + String($1))
            } else {
                return $0 + String($1)
            }
        }
    }

}
