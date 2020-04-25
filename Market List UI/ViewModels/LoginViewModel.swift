//
//  LoginViewModel.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 24/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import Foundation
import SwiftUI
import FBSDKLoginKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    
    @Published var user = Auth.auth().currentUser
    
    func login() {
        LoginManager().logIn(permissions: [], from: nil) { result, error in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let result = result, !result.isCancelled else {
                print("User cancelled login")
                return
            }
            
            print("Success ✅")
            
            Profile.loadCurrentProfile { profile, error in
                print(profile?.name)
                print(profile?.lastName)
                print(profile?.middleName)
                print(profile?.linkURL)
                print("ID: ", profile?.userID) // 2484709438265162
                print(profile?.imageURL(forMode: .square, size: CGSize(width: 300,height: 300)))
                
            }
            
            print("Access Token: ", AccessToken.current?.tokenString) //EAAHLP1FCnlcBAOHy0i7fptcewjNRyndPfZBm50xMOu4PAFqNtttR59Cg0Dl2sjZChGU7I9HjyEVIgzAGjoghSGMyXwBDEpFA9PSLnPPe9hKZCw1QZAQZCtorHcagNHrU5QFsIY57J8OQjzDgO3aoUmvqJqTcUef0M7C4sXCOHY0uFyVdKQy3OVteFxes1XxaV4BmNFFfyGqHHJNYoQxMNAi1jJw2EVv0aHn0uf7fk5QZDZD
            
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current?.tokenString ?? "")
            
            Auth.auth().signIn(with: credential) { authResult, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                print("Added user to Firebase 👨🏻‍💻")
                            
                if let sd: SceneDelegate = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate) {
                    sd.window?.rootViewController = UIHostingController(rootView: MyListsView())
                }
            }
        }
    }
}

