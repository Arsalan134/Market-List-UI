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
            .navigationBarItems(trailing: NavigationLink(destination: MyProductsView()) {
                Text("Show Detail View")
            })
        }.onAppear(perform: self.myListsVM.downloadMyLists)
    }
}

struct MyProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MyProductsView()
    }
}
