//
//  SceneDelegate.swift
//  UIKitNavigation
//
//  Created by hajime-nakamura on 2021/06/22.
//

import UIKit
import SwiftUI

struct ThirdView: View {
    var dismissAction: () -> Void
    var body: some View {
        Text("ThirdView")
        Button(action: dismissAction) {
            Text("Dismiss")
        }
    }
}

protocol ThirdViewControllerDelegate {
    func didDismiss()
}

class ThirdViewController: UIViewController {

    var delegate: ThirdViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let thirdView = ThirdView {
            self.dismiss(animated: true, completion: self.delegate?.didDismiss)
        }
        let vc = UIHostingController(rootView: thirdView)
        addChild(vc)
        view.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.constraintsToSuperView()
    }
}

struct SecondView: View {
    var buttonAction: () -> Void

    var body: some View {
        Text("Second")
        Button(action: buttonAction) {
            Text("Button")
        }
    }
}

class SecondViewController: UIViewController, ThirdViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        let secondView = SecondView {
            let vc = ThirdViewController()
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
        let vc = UIHostingController(rootView: secondView)
        addChild(vc)
        view.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.constraintsToSuperView()
    }

    func didDismiss() {
        let vc = UIViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

struct HomeView: View {
    var buttonAction: () -> Void

    var body: some View {
        Text("Home")
        Button(action: buttonAction) {
            Text("Button")
        }
    }
}

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeView = HomeView {
            let vc = SecondViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let vc = UIHostingController(rootView: homeView)
        addChild(vc)
        view.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.constraintsToSuperView()
    }
}

class RootViewController: UIViewController {
    let rootTabBarController = UITabBarController()
    lazy var homeNavigationController: UINavigationController = {
        UINavigationController(rootViewController: homeViewController)
    }()
    let homeViewController = HomeViewController()

    override func viewDidLoad() {
        addChild(rootTabBarController)
        view.addSubview(rootTabBarController.view)
        rootTabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        rootTabBarController.view.constraintsToSuperView()

        rootTabBarController.viewControllers = [homeNavigationController]
    }
}

extension UIView {
    func constraintsToSuperView() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

