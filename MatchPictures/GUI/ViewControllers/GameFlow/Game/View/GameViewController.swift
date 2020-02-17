//
//  GameViewController.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit
import Lottie

final class GameViewController: UIViewController {

    @IBOutlet weak private var menuButton: UIButton!
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var congraulationLabel: UILabel!
    @IBOutlet weak private var repeatGameButton: UIButton!
    @IBOutlet weak private var animatedBackgroundView: AnimationView!
    
    private let model: GameViewModelProtocol

    // MARK: - Init/Deinit

    init(model: GameViewModelProtocol) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        prepareUI()
        updateUI(isEndGame: false, animated: false)
        configureAnimation()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }

    // MARK: - UI

    private func prepareUI() {
        [menuButton, repeatGameButton].forEach({
            $0?.rounded()
            $0?.layer.addShadow()
        })
    }

    private func updateUI(isEndGame: Bool, animated: Bool) {
        UIView.animate(withDuration: animated ? 0.3 : 0.0) { [weak self] in
            guard let self = self else { return }
            [self.repeatGameButton, self.congraulationLabel].forEach({ $0?.isHidden = !isEndGame })
        }

        if animated && !isEndGame {
            collectionView.performBatchUpdates({
                collectionView.visibleCells.forEach {
                    ($0 as? CardCollectionViewCell)?.updateStateAnimated()
                }
            })
        }
    }

    // MARK: - Collection View Methods

    private func updateCellsData() {
        collectionView.indexPathsForVisibleItems.forEach {
            (collectionView.cellForItem(at: $0) as? CardCollectionViewCell)?.setup(with: model.item(at: $0.row))
        }
    }

    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNibReusable(CardCollectionViewCell.self)
    }

    // MARK: - Animation

    private func configureAnimation() {
        animatedBackgroundView.animation = AnamationGenerator.make(.menuBackround)
        animatedBackgroundView.loopMode = .autoReverse
        animatedBackgroundView.backgroundBehavior = .pauseAndRestore
        animatedBackgroundView.contentMode = .scaleAspectFill
    }

    private func startAnimation() {
        self.animatedBackgroundView.play()
    }    

    // MARK: - Actions

    @IBAction private func didMenuButtonClicked(_ sender: UIButton) {
        sender.bounce()
        model.openMenu()
    }

    @IBAction private func didRepeatButtonClicked(_ sender: UIButton) {
        sender.bounce()
        updateUI(isEndGame: false, animated: true)
        model.repeatGame()
        updateCellsData()
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension GameViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard model.canSelectItem(at: indexPath.row) else { return }
        guard let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell else { return }
        cell.updateStateAnimated { [weak self] in
            self?.model.chooseItem(at: indexPath.row)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsSpacing: CGFloat = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0.0
        return CGSize(width: (collectionView.frame.width - itemsSpacing * 2)/3, height: (collectionView.frame.height - itemsSpacing)/2)
    }

}

// MARK: - UICollectionViewDataSource
extension GameViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.itemsCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusable(type: CardCollectionViewCell.self, at: indexPath)
        cell.setup(with: model.item(at: indexPath.row))
        return cell
    }

}

// MARK: - MatchGameDelegate
extension GameViewController: MatchGameDelegate {

    func hideAllNotMatchedCards() {
        collectionView.performBatchUpdates({
            collectionView.indexPathsForVisibleItems.forEach {
                let card = model.item(at: $0.row)
                if card.isFliped && !card.isMatched {
                    (collectionView.cellForItem(at: $0) as? CardCollectionViewCell)?.updateStateAnimated {
                        card.isFliped.toggle()
                    }
                }
            }
        })
    }

    func didEndGame() {
        updateUI(isEndGame: true, animated: true)
    }

}
