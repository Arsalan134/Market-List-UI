//
//  MyProductsViewModel.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 26/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FBSDKCoreKit
import CodableFirebase

class MyProductsViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @EnvironmentObject var settings: UserSettings
    
    func downloadProducts() {
        //        guard let listID = self.productList.selectedProductList?.id, let id = Auth.auth().currentUser?.uid else {return}
        // TODO: Return to default id of user not Naza's
        let listID = "nansodnaosdnoasndoas"
        
        db.collection("users").document("RxdJAxLC0MOGt9NAp7fHzYTb65c2").collection("lists").document(listID).collection("products").addSnapshotListener { [weak self] snapshot, error in
            
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if let documents = snapshot?.documents {
                    for doc in documents {
                        var product = try! FirestoreDecoder().decode(Product.self, from: doc.data())
                        product.id = doc.documentID
                        product.isBought = product.isBought ?? false
                        self?.products.append(product)
                    }
                }
            }
        }
    }
}
