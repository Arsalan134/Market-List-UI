//
//  MyListsModelView.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 24/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FBSDKCoreKit
import CodableFirebase

class UserSettings: ObservableObject {
    @Published var score = 0
}

class MyListsViewModel: ObservableObject {
    
    @Published var lists: [ProductList] = []
    
    func downloadMyLists() {
        guard let id = Auth.auth().currentUser?.uid else { return }

        db.collection("users").document(id).collection("lists").order(by: "updated at", descending: true).addSnapshotListener { [weak self] snapshot, error in
            
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                print("Downloaded lists")
                self?.lists = []
                if let snapshot = snapshot {
                    for document in snapshot.documents {
                        if var list = try? FirestoreDecoder().decode(ProductList.self, from: document.data()) {
                            list.id = document.documentID
                            self?.lists.append(list)
                        }
                    }
                    let testList = ProductList(id: "123", name: "Name", products: [])
                    self?.lists.append(testList)
                }
            }
        }
    }
    
    func addNewList(with productList: ProductList = ProductList()) {
        guard let id = Auth.auth().currentUser?.uid else { return }
        
        guard  let jsonData = try? JSONEncoder().encode(productList) else { return }
        
        do {
            if var jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String : Any] {
                
                jsonArray["products"] = nil
                
                // Filter empty arguments
                jsonArray = jsonArray.filter { arg -> Bool in
                    return (arg.value as? String) != ""
                }
                
                jsonArray["created at"] = Timestamp.init()
                jsonArray["updated at"] = Timestamp.init()
                
                // Add a new document with a generated id.
                var ref: DocumentReference? = nil
                
                ref = db.collection("users").document(id).collection("lists").addDocument(data: jsonArray) { err in
                    if let err = err {
                        print("ERROR while adding document: \(err)")
                    } else {
                        //                        print("Product list added with ID: \(ref!.documentID)")
                        productList.products?.forEach({ (product) in
                            do {
                                if let jsonData = try? JSONEncoder().encode(product) {
                                    if let productJSON = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String : Any] {
                                        if let ref = ref {
                                            db.collection("users").document(id).collection("lists").document(ref.documentID).collection("products").document().setData(productJSON)
                                        }
                                    }
                                }
                            } catch {
                                print(error.localizedDescription)
                            }
                        })
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
