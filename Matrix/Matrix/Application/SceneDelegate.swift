//
//  SceneDelegate.swift
//  Matrix
//
//  Created by Or.Avraham on 17/03/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var rootController: UINavigationController {
        self.window!.rootViewController as! UINavigationController
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let fruitTableVC = FeedTableViewController()
        fruitTableVC.viewModel = FeedTableViewModelImpl(
            with: RepositoryImpl(),
            parser: JSONDataParser()
        )
        
        let navigationController = UINavigationController(rootViewController: fruitTableVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

