//
//  SceneDelegate.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 24/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import UIKit
import SwiftUI
import FBSDKCoreKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        window.rootViewController = UIHostingController(rootView: contentView.environmentObject(settings))

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            
            let window = UIWindow(windowScene: windowScene)
            if Auth.auth().currentUser?.uid != nil {
                let settings = UserSettings()
                window.rootViewController = UIHostingController(rootView: MyListsView().environmentObject(settings))
            } else {
                window.rootViewController = UIHostingController(rootView: LoginView())
            }

            self.window = window
            window.makeKeyAndVisible()
        }
        
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let openURLContext = URLContexts.first {
            ApplicationDelegate.shared.application(UIApplication.shared, open: openURLContext.url, sourceApplication: openURLContext.options.sourceApplication, annotation: openURLContext.options.annotation)
        }
    }
    
    
    
    
    //    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    //        if let openURLContext = URLContexts.first {
    //            ApplicationDelegate.shared.application(UIApplication.shared, open:
    //                openURLContext.url, sourceApplication:
    //                openURLContext.options.sourceApplication, annotation:
    //                openURLContext.options.annotation)
    //        }
    //    }
    
    //    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    //        if let openURLContexts = URLContexts.first {
    //
    //        }
    //    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        
        //        The final step is to let Facebook know when a user has launched your app. This is useful if you plan to advertise your app through Facebook or if you want to use their analytics to track your app’s metrics. Add the following line to your applicationDidBecomeActive method with your app’s delegate:
        
        //        AppEventsLogger.activate(application)
        
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


struct SceneDelegate_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
