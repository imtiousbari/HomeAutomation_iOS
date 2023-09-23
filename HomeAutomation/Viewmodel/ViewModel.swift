//
//  ViewModel.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/9/23.
//

import SwiftUI

class SwitchViewModel: ObservableObject {
    @Published var apiResponse: ApiResponse?
    
    func fetchData() {
        guard let url = URL(string: "https://homeautomation.cisstaging.com/api/switch?light=0&fan=0&bell=0") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(ApiResponse.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = response
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func toggleSwitch(_ switchType: String) {
        guard var response = apiResponse else {
            return
        }
        
        var updatedResponse = response // Create a mutable copy
        
        switch switchType {
        case "fan":
            updatedResponse.fan = response.fan == 1 ? 0 : 1
        case "light":
            updatedResponse.light = response.light == 1 ? 0 : 1
        case "bell":
            updatedResponse.bell = response.bell == 1 ? 0 : 1
        default:
            break
        }
        
        // You can update the API here with the new switch values if needed.
        
        apiResponse = updatedResponse
    }

}

