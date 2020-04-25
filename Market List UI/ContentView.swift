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
    
    var body: some View {
        EmptyView()
//        NavigationView {
//            ForEach(self.myListsVM.lists) { list in
//                Text("Salmasl")
//            }
//        }.navigationBarTitle("Lists")
//            .navigationBarItems(trailing: Button(action: {
//                print("pressed")
//            }, label:  {
//                Text("Label")
//            }))
    }
}

struct MyListsView_Previews: PreviewProvider {
    static var previews: some View {
        MyListsView()
    }
}

//                NavigationView {
//            ScrollView {
//                Text(userVM.messages)
//
//                ForEach(userVM.courses) { course in
//                    Text(course.name)
//                }
//
//            }.navigationBarTitle("Lists")
//                .navigationBarItems(trailing: Button(action: {
//                    print("pressed")
//                    self.userVM.fetchCourses()
//                }, label:  {
//                    Text("Label")
//                }))
//        }

//            VStack {
//                List {
//            ForEach(myListsVM.$lists, id: \.self) { list in
//                //                        NavigationLink(destination: ProductsView(list: list)) {
//                //                            HStack {
//                //                                Image(systemName: "photo")
//                //                                VStack(alignment: .leading) {
//                //                                    Text("\(list.name ?? "No name")")
//                //                                    Text("20 people")
//                //                                }
//                //                            }
//                //
//                //                            Text(list.title)
//                //                        }
//                //                    }
//
//            }
