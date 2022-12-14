//
//  AppDelegate.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import UIKit

@main class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let vc = CharacterModuleFactory.createView()
        window?.rootViewController = getNavgationController(rootController: vc)
        return true
    }
    
    private func getNavgationController(rootController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootController)
        navigationController.navigationItem.largeTitleDisplayMode = .always
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.topItem?.title = "Rick and Morty"
        navigationController.navigationBar.isTranslucent = true
        return navigationController
    }
    
}


