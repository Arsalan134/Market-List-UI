//
//  ContentView.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 24/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import SwiftUI

struct MyListsView: View {
    
    @ObservedObject var myListsVM = MyListsViewModel()
    @State private var ispp = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Salam")
                ScrollView {
                    ForEach(self.myListsVM.lists) { list in
                        Text("Necasiz")
                    }
                }
            }
            .navigationBarTitle("My Lists")
            .navigationBarItems(trailing: Button(action: {
                self.myListsVM.$productListEnviroment.selectedProductList = ProductList()
            }, label: {
                NavigationLink(destination: MyProductsView()) {
                    Text("Show Detail View")
                }
            }))
        }.onAppear(perform: self.myListsVM.downloadMyLists)
    }
}

struct MyListsView_Previews: PreviewProvider {
    static var previews: some View {
        MyListsView()
    }
}
/*func downloadProducts(of list: ProductList?, _ completion: @escaping(_ downloadedProducts: [Product]) -> Void) {

    guard let listID = list?.id, let id = Auth.auth().currentUser?.uid else {return}
    // TODO: Return to dfault id of user not Naza's
    db.collection("users").document("RxdJAxLC0MOGt9NAp7fHzYTb65c2").collection("lists").document(listID).collection("products").addSnapshotListener { snapshot, error in

        if let error = error {
            print("Error getting documents: \(error)")
        } else {
            var products: [Product] = []
            if let documents = snapshot?.documents {
                for doc in documents {
                    var product = try! FirestoreDecoder().decode(Product.self, from: doc.data())
                    product.id = doc.documentID
                    product.isBought = product.isBought ?? false
                    products.append(product)
                }
                completion(products)
            }
        }
    }
}*/
