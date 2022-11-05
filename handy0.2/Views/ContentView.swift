//
//  ContentView.swift
//  handy0.2
//
//  Created by Shokri Alnajjar on 07/09/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loginVM = LoginViewModel()
    var body: some View {
        if !loginVM.isAuthenticated {
            ZStack{
                
                VStack {
                    Form {
                        HStack {
                            Spacer()
                            Image(systemName: loginVM.isAuthenticated ? "lock.fill" : "lock.open")
                        }
                        TextField("Username", text: $loginVM.username)
                        SecureField("Password", text: $loginVM.password)
                        
                        HStack {
                            Spacer()
                            Button("Login") {
                                loginVM.login()
                            }
                            Button("Sign out") {
                                
                            }
                            Spacer()
                        }
                        
                    }.buttonStyle(PlainButtonStyle())
                    VStack {
                        Spacer()
                        Spacer()
                    }
                }
            }
        } else {
            HomeView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
