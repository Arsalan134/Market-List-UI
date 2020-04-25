//
//  LoginView.swift
//  Market List UI
//
//  Created by Arsalan Iravani on 24/04/2020.
//  Copyright © 2020 Arsalan Iravani. All rights reserved.
//

import SwiftUI

struct LoginView: View {
        
    @ObservedObject var loginVM = LoginViewModel()
    @State private var typedEmail = ""
    
    var body: some View {
        NavigationView {
            VStack() {
                Image("Arsalan")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.bottom, 50)
                 
                TextField("Email", text: self.$typedEmail)
                    .padding()
                    .cornerRadius(20.0)
                
                Button(action: {
                    self.loginVM.login()
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
