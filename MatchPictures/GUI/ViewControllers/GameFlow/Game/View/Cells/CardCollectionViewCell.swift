//
//  CardCollectionViewCell.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

final class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var backImageView: UIImageView!
    @IBOutlet weak private var frontSideView: UIView!

    private var card: Card!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
    }

    // MARK: - UI

    private func prepareUI() {
        [frontSideView, backImageView].forEach({
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.borderWidth = 2.0
            $0?.layer.cornerRadius = 10.0
        })
    }

}

// MARK: - Public

extension CardCollectionViewCell {

    func setup(with card: Card) {
        self.card = card
        self.backImageView.image = card.image
    }

    func updateStateAnimated(completion: EmptyClosure? = nil) {
        UIView.transition(from: card.isFliped ? backImageView : frontSideView,
                          to: !card.isFliped ? backImageView : frontSideView,
                          duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews]) { _ in completion?() }
    }

}
