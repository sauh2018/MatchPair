import UIKit

class WindowCoordinator: Coordinator<UIWindow> {

    func setRoot(viewControler: UIViewController) {
        container.rootViewController = viewControler
    }

}
