import UIKit

class AppCoordinator: WindowCoordinator {

    override func start() {
        configure()
    }

    // MARK: - Configurations

    private func configure() {
        self.setRoot(viewControler: UIViewController())
        presentSplash()
    }

    private func presentSplash() {
        removeAllChilds()
        let output = SplashViewModel.ModuleOutput { [weak self] action in
            switch action {
            case .presentAdvertasingFlow:
                self?.presentAdvertisingFlow()
            case .presentGameFlow:
                self?.presentGameFlow()
            }
        }

        let splash = SplashControllerConfigurator.configure(output: output)
        setRoot(viewControler: splash)
    }

    // MARK: - Logic

    private func presentAdvertisingFlow() {
        removeAllChilds()
        let coord = AdvertisingCoordinator(container: UINavigationController())
        addChild(coord)
        coord.start()
        setRoot(viewControler: coord.container)
    }

    private func presentGameFlow() {
        removeAllChilds()
        let coord = GameCoordinator(container: UINavigationController())
        addChild(coord)
        coord.start()
        setRoot(viewControler: coord.container)
    }

}
