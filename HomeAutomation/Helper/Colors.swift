//
//  Colors.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 20/12/23.
//

import SwiftUI

import SwiftUI

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
    
    static let Bg = Color(hex: "#E5EDF4")
    static let Primary = Color(hex: "#01337A")
    static let CardBg = Color(hex: "#EEEFF1")
    static let CusYellow = Color(hex: "#D3B007")
    static let MainBG = Color(hex: "#010A5F")
//    static let BtnGray = Color(hex: "#757575")
//    static let LoginBG = Color(hex: "#F1F2F6")
}

