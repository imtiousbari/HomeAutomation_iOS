//
//  ViewModel.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 20/5/24.
//

//import Foundation
//import Alamofire
//import SwiftyJSON
//
//class SwitchViewModel: ObservableObject {
//    @Published var switchResponse: SwitchResponse?
//    
//    func fetchData(light: Int, fan: Int, bell: Int) {
//        let url = "\(Api.baseUrl)switch?light=\(light)&fan=\(fan)&bell=\(bell)"
//        print("URL: \(url)") // Print the URL
//        
//        AF.request(url).responseJSON { [weak self] response in
//            guard let self = self else { return }
//            
//            switch response.result {
//            case .success(let value):
//                
//                let json = JSON(value)
//                print("JSON Data: \(json)")
//                let status = json["status"].intValue
//                let msg = json["msg"].stringValue
//                let fan = json["fan"].intValue
//                let light = json["light"].intValue
//                let bell = json["bell"].intValue
//                self.switchResponse = SwitchResponse(status: status, msg: msg, fan: fan, light: light, bell: bell)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
import Foundation
import Alamofire
import SwiftyJSON

class SwitchViewModel: ObservableObject {
    @Published var switchResponse: SwitchResponse?
    
    func fetchInitialData(completion: @escaping (SwitchResponse) -> Void) {
        let url = "\(Api.baseUrl)switch"
        print("URL: \(url)") // Print the URL
        
        AF.request(url).responseJSON { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON Data: \(json)")
                let status = json["status"].intValue
                let msg = json["msg"].stringValue
                let fan = json["fan"].intValue
                let light = json["light"].intValue
                let bell = json["bell"].intValue
                let switchResponse = SwitchResponse(status: status, msg: msg, fan: fan, light: light, bell: bell)
                
                // Store response in viewModel
                self.switchResponse = switchResponse
                
                // Call completion with response
                completion(switchResponse)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchData(light: Int, fan: Int, bell: Int) {
        let url = "\(Api.baseUrl)switch?light=\(light)&fan=\(fan)&bell=\(bell)"
        print("URL: \(url)") // Print the URL
        
        AF.request(url).responseJSON { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                print("JSON Data: \(json)")
                let status = json["status"].intValue
                let msg = json["msg"].stringValue
                let fan = json["fan"].intValue
                let light = json["light"].intValue
                let bell = json["bell"].intValue
                self.switchResponse = SwitchResponse(status: status, msg: msg, fan: fan, light: light, bell: bell)
            case .failure(let error):
                print(error)
            }
        }
    }
}
