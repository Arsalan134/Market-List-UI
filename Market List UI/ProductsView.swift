//
//  ProductsView.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 24/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import SwiftUI

struct ProductsView: View {
    
    var list: ProductList
    
    @State private var products: [Product] = []
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach((list.products ?? []), id: \.self) { product in
                        HStack {
                            Image(systemName: "photo")
                            VStack(alignment: .leading) {
                                Text("\(product.name ?? "No name")")
                                Text("20 people")
                            }
                        }
                    }
                }
            }
        }
//        .onAppear {
//            downloadProducts(of: self.list) { (products) in
//                self.products = products
//                print(products)
//            }
//        }
    }
}

//struct ProductsView_Previe.ws: PreviewProvider {
//    static var previews: some View {
//        ProductsView()
//    }
//}
