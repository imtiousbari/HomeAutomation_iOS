//
//  CardView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/12/23.
//

import SwiftUI

struct CardView: View {
    var imageName: String
    var text: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.bottom,10)
                Text(text)
                    .font(
                        Font.custom("Open Sans", size: 14)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.26, green: 0.26, blue: 0.26))
                    
            }
        }
        .frame(width: 111, height: 111, alignment: .center)
//        .background(Color.CardBg)
        .background(
        LinearGradient(
        stops: [
        Gradient.Stop(color: Color(red: 0.87, green: 0.88, blue: 0.89), location: 0.00),
        Gradient.Stop(color: Color(red: 1, green: 1, blue: 1), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 1)
        )
        )
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .inset(by: 1.5)
                .stroke(.white, lineWidth: 3)
        )
    }
}





#Preview {
    CardView(imageName: "pp", text: "Custom Text")
}
