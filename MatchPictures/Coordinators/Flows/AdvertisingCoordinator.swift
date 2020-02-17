import UIKit

class AdvertisingCoordinator: NavigationCoordinator {

    override func start() {
        container.setNavigationBarHidden(true, animated: false)
        presentWebPage()
    }

    // MARK: - Logic

    private func presentWebPage() {
        let webPageUrl: String = AppManager.shared.configuration.webPageURL
        let webPageController = WebPageControllerConfigurator.configure(data: WebViewModel.ModuleInput(urlPath: webPageUrl))
        set([webPageController])
    }

}
