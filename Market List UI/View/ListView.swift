//
//  ListView.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 26/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    let height: CGFloat = 40
    var icon: String = "Arsalan"
    
    var body: some View {
        ZStack {
            Circle()
                .fill( LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: height, height: height)
            
            VStack {
                Image(uiImage: UIImage(named: icon) ?? UIImage(named: "Arsalan")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height / 2, alignment: .center)
            }
        }
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
