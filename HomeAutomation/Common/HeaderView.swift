//
//  HeaderView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 22/9/23.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        VStack{
            
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: "person.circle.fill") // Replace "person.circle.fill" with the SF Symbol you want
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 40)
                    .foregroundColor(.white) // Set the icon color as needed
                    .background(Circle().fill(Color.blue)) // Set the background color of the icon circle as needed
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .offset(x: 20, y: 0) // Adjust the offset as needed
                
                
                Spacer(minLength: 1)
                
                // Mobile/Body - 14pt/Body - Regular
                VStack {
                    Text("Welcome Office,")
                        .font(Font.custom("Noto Sans", size: 14))
                        .foregroundColor(Color(red: 0.85, green: 0.87, blue: 0.9))
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    // Mobile/Body - 16pt/Body - Semibold
                    Text("Ibrahim")
                        .font(
                            Font.custom("Noto Sans", size: 16)
                                .weight(.semibold)
                        )
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                }
                .padding()
                
                CurrentDate()
                    .padding(.trailing, 16)
                
            }
//            Spacer()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color(red: 0.13, green: 0.14, blue: 0.15))
    }
    
}
