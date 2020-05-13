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
    
    @State var showContent = false
    
    var body: some View {
        ScrollView {
           VStack {
              HStack {
                 VStack(alignment: .leading) {
                    Text("Courses")
                       .font(.largeTitle)
                       .fontWeight(.heavy)

                    Text("22 Courses")
                       .foregroundColor(.gray)
                 }
                 Spacer()
              }
              .padding(.leading, 60.0)

              ScrollView(.horizontal, showsIndicators: false) {
                 HStack(spacing: 30.0) {
                    ForEach(myListsVM.lists) { item in
                       Button(action: { self.showContent.toggle() }) {
                          GeometryReader { geometry in
                            CourseView(title: item.name ?? "no name")
                                .rotation3DEffect(Angle(degrees:
                                   Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
//                                .sheet(isPresented: self.$showContent) { ContentView()
//                            }
                          }
                          .frame(width: 246, height: 360)
                       }
                    }
                 }
                 .padding(.leading, 30)
                 .padding(.top, 30)
                 .padding(.bottom, 70)
                 Spacer()
              }
//              CertificateRow()
           }
           .padding(.top, 78)
        }
    }
}

struct MyListsView_Previews: PreviewProvider {
    static var previews: some View {
        MyListsView()
    }
}
