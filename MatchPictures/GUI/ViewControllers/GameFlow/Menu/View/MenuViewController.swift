//
//  MenuViewController.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit
import Lottie

final class MenuViewController: UIViewController {

    @IBOutlet weak private var animatedBackgroundVIew: AnimationView!
    @IBOutlet weak private var playGameButton: UIButton!

    private let model: MenuModelProtcol

    // MARK: - Init/Deinit

    init(model: MenuModelProtcol) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        preapreUI()
        configureAnimation()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }

    // MARK: - Animation

    private func configureAnimation() {
        animatedBackgroundVIew.animation = AnamationGenerator.make(.menuBackround)
        animatedBackgroundVIew.loopMode = .loop
        animatedBackgroundVIew.backgroundBehavior = .pauseAndRestore
        animatedBackgroundVIew.contentMode = .scaleAspectFill
    }

    private func startAnimation() {
        animatedBackgroundVIew.play()
    }

    // MARK: - UI

    private func preapreUI() {
        playGameButton.rounded()
        playGameButton.layer.addShadow()
    }

    // MARK: - Actions

    @IBAction private func didPlayGameButtonClicked(_ sender: Any) {
        model.openGame()
    }

}
