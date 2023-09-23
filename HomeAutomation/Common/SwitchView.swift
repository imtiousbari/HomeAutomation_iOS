//
//  SwitchView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 23/9/23.
//

import SwiftUI

struct SwitchView: View {
    var body: some View {
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
           
            VStack(alignment: .leading) {
              
                

                //          View()
                // Mobile/Body - 14pt/Body - Semibold
                ZStack {
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color(red: 0.77, green: 0.83, blue: 0.89).opacity(0.5))
                
                Circle()
                    .frame(width: 125, height: 125)
                    .foregroundColor(Color(red: 0.84, green: 0.90, blue: 0.96).opacity(0.5))
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(red: 0.98, green: 1.03, blue: 1.09).opacity(0.5))            }
                .shadow(radius: 20)
                .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                .padding(.leading,-110)
                .padding(.top,-30)

               
                Spacer()
                Text("Smart Lamp")
                  .font(
                    Font.custom("Noto Sans", size: 14)
                      .weight(.semibold)
                  )
                  .foregroundColor(.white)
                  .frame(maxWidth: .infinity, alignment: .bottomLeading)
                // Mobile/Body - 12pt/Body - Medium
                Text("Living Room")
                  .font(
                    Font.custom("Noto Sans", size: 12)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.85, green: 0.87, blue: 0.9))
                  .frame(maxWidth: .infinity, alignment: .bottomLeading)
                
                
                    
                
            }
            .padding(13)
            .frame(width: 165, height: 180, alignment: .leading)
            .background(Color(red: 0.25, green: 0.27, blue: 0.3))
            .cornerRadius(16)
            .shadow(color: Color(red: 0.2, green: 0.2, blue: 0.28).opacity(0.02), radius: 10, x: 0, y: 4)
            .shadow(color: Color(red: 0.05, green: 0.1, blue: 0.29).opacity(0.04), radius: 2.5, x: 0, y: 0)
           
           
        
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}
