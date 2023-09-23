//
//  CurrentDate.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 22/9/23.
//



import SwiftUI

struct CurrentDate: View {
    private let monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM" // Month abbreviation
        return formatter
    }()
    
    private let dayYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/yy" // Day and year
        return formatter
    }()

    private var currentMonth: String {
        return monthFormatter.string(from: Date())
    }
    
    private var currentDayYear: String {
        return dayYearFormatter.string(from: Date())
    }

    var body: some View {
        VStack(alignment: .trailing) {
            Text(currentMonth)
                .font(Font.custom("Noto Sans", size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.85, green: 0.87, blue: 0.9))
            
            Text(currentDayYear)
                .font(Font.custom("Noto Sans", size: 14))
                .foregroundColor(Color(red: 0.85, green: 0.87, blue: 0.9))
        }
    }
}
