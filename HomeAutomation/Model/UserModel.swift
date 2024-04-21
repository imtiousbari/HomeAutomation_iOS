//
//  UserModel.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 20/2/24.
//

import Foundation

struct User: Decodable, Equatable{
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
    let token: String
}


//class LoginViewModel: ObservableObject {
//    @Published var user: User?
//    @Published var error: String?
//    @Published var isLoggedIn = false // Add this line
//
//    func loginUser(username: String, password: String) {
//        error = nil
//        guard let url = URL(string: "https://dummyjson.com/auth/login") else {
//                    self.error = "Invalid URL"
//                    return
//                }
//                
//                let body: [String: Any] = [
//                    "username": username,
//                    "password": password
//                ]
//                
//                do {
//                    let jsonData = try JSONSerialization.data(withJSONObject: body)
//                    
//                    var request = URLRequest(url: url)
//                    request.httpMethod = "POST"
//                    request.httpBody = jsonData
//                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//                    
//                    URLSession.shared.dataTask(with: request) { data, response, error in
//                        guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
//                            self.error = error?.localizedDescription ?? "Unknown error"
//                            return
//                        }
//                        
//                        guard response.statusCode == 200 else {
//                            self.error = "Invalid Username & Password"
//                            return
//                        }
//                        
//                        do {
//                            let decoder = JSONDecoder()
//                            let user = try decoder.decode(User.self, from: data)
//                            DispatchQueue.main.async {
//                                self.user = user
//                                self.isLoggedIn = true // Set isLoggedIn to true upon successful login
//                            }
//                        } catch {
//                            self.error = "Error decoding JSON: \(error.localizedDescription)"
//                        }
//                    }.resume()
//                } catch {
//                    self.error = "Error serializing JSON: \(error.localizedDescription)"
//                }
//            }
//        }
class LoginViewModel: ObservableObject {
    @Published var user: User?
    @Published var error: String?
    @Published var isLoggedIn = false

    func loginUser(username: String, password: String) {
        // Reset error state
        error = nil
        
        guard let url = URL(string: "https://dummyjson.com/auth/login") else {
            self.error = "Invalid URL"
            return
        }
        
        let body: [String: Any] = [
            "username": username,
            "password": password
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                    DispatchQueue.main.async {
                        self.error = error?.localizedDescription ?? "Unknown error"
                    }
                    return
                }
                
                guard response.statusCode == 200 else {
                    DispatchQueue.main.async {
                        self.error = "Invalid Username & Password"
                    }
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(User.self, from: data)
                    DispatchQueue.main.async {
                        self.user = user
                        self.isLoggedIn = true
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.error = "Error decoding JSON: \(error.localizedDescription)"
                    }
                }
            }.resume()
        } catch {
            self.error = "Error: \(error.localizedDescription)"
        }
    }
}
