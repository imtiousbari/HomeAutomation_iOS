//
//  DataModel.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/9/23.
//

struct ApiResponse: Codable {
    let status: Int
    let msg: String
    var fan: Int // Change from let to var
    var light: Int // Change from let to var
    var bell: Int // Change from let to var
}

