//
//  Home.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 13/05/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import SwiftUI

struct Home: View {
    
   @State var show = false
   @State var showProfile = false

   var body: some View {
      ZStack(alignment: .top) {
         MyListsView()
            .blur(radius: show ? 20 : 0)
            .scaleEffect(showProfile ? 0.95 : 1)
            .animation(.default)


         HStack {
//             MenuButton(show: $show)
//                .offset(x: -40)
//                 Spacer()
//
//             MenuRight(show: $showProfile)
//                .offset(x: -16)
            Image("Arsalan")
         }
//         .offset(y: showProfile ? statusBarHeight : 80)
         .animation(.spring())

      }
      .background(Color.gray)
//      .edgesIgnoringSafeArea(.all)
   }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
