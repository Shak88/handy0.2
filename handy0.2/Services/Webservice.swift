//
//  Webservice.swift
//  handy0.2
//
//  Created by Shokri Alnajjar on 08/09/2022.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
    
}
struct LoginRequestBody : Codable {
    let username : String
    let password: String
}


struct LoginResponse: Codable {
    let uid: Int
    let userContext: UserContext
    let companyID: Int
    let accessToken: String?
    let expiresIn: Int
    let refreshToken: String
    let refreshExpiresIn: Int

    enum CodingKeys: String, CodingKey {
        case uid
        case userContext = "user_context"
        case companyID = "company_id"
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case refreshExpiresIn = "refresh_expires_in"
    }
}

// MARK: - UserContext
struct UserContext: Codable {
    let lang, tz: String
    let uid: Int
}




class Webservice {
    func login(username: String, password: String,  completion: @escaping (Result<String,AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://192.168.1.163:8060/api/auth/get_tokens") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let body = LoginRequestBody(username: username , password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("text/html", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        

        URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No Data")))
                return
            }
            
          
              //Checking the response data
//            if let dataString = String(data: data, encoding: .utf8) {
//                print("got dataString: \n\(dataString)")
//            }

            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
//            print("login response:   \(loginResponse.result.username)")
            guard let token = loginResponse.accessToken else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
            
        }.resume()
        
    }
}
