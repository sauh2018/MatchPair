//
//  SplashViewController.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit
import Lottie

final class SplashViewController: UIViewController {

    @IBOutlet weak private var animationView: AnimationView!

    private let model: SplashViewModelProtocol

    // MARK: - Init/Deinit

    init(model: SplashViewModelProtocol) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAnimation()
        model.loadConfigurations()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playAnimation()
    }

    // MARK: - Animation

    private func configureAnimation() {
        animationView.animation = AnamationGenerator.make(.splash)
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.loopMode = .playOnce
    }

    private func playAnimation() {
        animationView.play { [weak self] _ in
            guard self?.model.isDataLoaded == false else {
                self?.moveNext()
                return
            }

            self?.playAnimation()
        }
    }

    // MARK: - Logic

    private func moveNext() {
        model.moveToNextVC()
    }

}
