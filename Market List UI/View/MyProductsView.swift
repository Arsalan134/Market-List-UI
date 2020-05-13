//
//  MyProductsVIew.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 26/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import SwiftUI

struct MyProductsView: View {
    
    @ObservedObject var myProductsVM = MyProductsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Salam")
                ScrollView {
                    ForEach(self.myProductsVM.products) { product in
                        Text("Necasiz")
                    }
                }
            }
            .navigationBarTitle("My Lists")
            .navigationBarItems(trailing: NavigationLink(destination: MyProductsView()) {
                Text("Show Detail View")
            })
        }.onAppear(perform: self.myProductsVM.downloadProducts)
    }
}

struct MyProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MyProductsView()
    }
}
