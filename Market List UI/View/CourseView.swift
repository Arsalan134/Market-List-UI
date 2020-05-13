//
//  CourseView.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 13/05/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import SwiftUI

struct CourseView: View {

   var title = "Build an app with SwiftUI"
//   var image = "Illustration1"
//   var color = Color("background3")
//   var shadowColor = Color("backgroundShadow3")

   var body: some View {
      return VStack(alignment: .leading) {
         Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(30)
            .lineLimit(4)

         Spacer()

         Image("Arsalan")
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 246, height: 150)
            .padding(.bottom, 30)
      }
      .background(Color.red)
      .cornerRadius(30)
      .frame(width: 246, height: 360)
      .shadow(color: Color.gray, radius: 20, x: 0, y: 20)
   }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
