//
//  LoginViewModel.swift
//  handy0.2
//
//  Created by Shokri Alnajjar on 08/09/2022.
//

import Foundation


class LoginViewModel: ObservableObject {
    
    var username: String  = ""
    var password: String = ""
    @Published var isAuthenticated: Bool = false
    
    func login() {
        let defaults = UserDefaults.standard
        
        Webservice().login(username: username, password: password) {result in
            
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "token")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
                
                print("here: \(self.isAuthenticated)")
                print(token)
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "token") {
            isAuthenticated = true
            print("xxxxxxxx")
            return
        }
    }
    
}
