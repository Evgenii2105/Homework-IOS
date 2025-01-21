//
//  SceneDelegate.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 26.08.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: TodoListController())
        window.makeKeyAndVisible()
        self.window = window
        
        //        window = UIWindow(windowScene: windowScene)
        //        window?.rootViewController = TableViewController()
        //        window?.makeKeyAndVisible()
        //        window?.backgroundColor = .red
    }
}
