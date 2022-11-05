//
//  TestView.swift
//  handy0.2
//
//  Created by Shokri Alnajjar on 29/09/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        if !loginVM.isAuthenticated {
            NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.white,.orange,.orange]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    VStack{
                        
                        Image("handy-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width:220,height:100)
                            .padding(.top,40)
                        Spacer()
                        
                        VStack(spacing:20) {
                            CustomTextField(text: $email, imageName: "envelope", placeHolder: Text("Email"))
                                .padding()
                                .background(Color(.init(white:1,alpha:0.35)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal,32)
                            
                            CustomSecureField(text: $password, placeHolder: Text("Password"))
                                .padding()
                                .background(Color(.init(white:1,alpha:0.35)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal,32)
                        }
                        Button{
                            loginVM.username = email
                            loginVM.password = password
                            loginVM.login()
                        }label: {
                            Text("Sign in")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width:360,height: 50)
                                .background(.black)
                                .clipShape(Capsule())
                                .padding()
                        }
                        
                        
                        Spacer()
                        
                        
                    }
                }
            }
        } else {
            HomeView()
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
