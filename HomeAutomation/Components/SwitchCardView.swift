//
//  SwitchCardView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 24/12/23.
//

import SwiftUI

struct SwitchView: View {
    @State private var isSwitchOn = false

    var body: some View {
        Rectangle()
            .frame(width: 170, height: 120)
            .foregroundColor(isSwitchOn ? Color.Primary : .white)
            .cornerRadius(15)
            .overlay(
                VStack {
                    HStack {
                        Image(systemName: isSwitchOn ? "lightbulb.max.fill" : "lightbulb")
                            .font(.system(size: isSwitchOn ? 15 : 20))
                            .foregroundColor(isSwitchOn ? .white : .black)
                        Spacer()
                        Image(systemName: "power.circle")
                            .font(.system(size: 20))
                            .foregroundColor(isSwitchOn ? .green : .black)
                            .onTapGesture {
                                self.isSwitchOn.toggle()
                            }
                    }
                    .padding(15)
                    Spacer()
                    HStack {
                        Text("Bedroom Light 01:")
                            .foregroundColor(isSwitchOn ? .white : .black)
                            .font(.system(size: 12))
                        Text(isSwitchOn ? "ON" : "OFF")
                            .foregroundColor(isSwitchOn ? Color.CusYellow : .green)
                            .font(.system(size: 12))
                    }
                    .padding(.bottom, 10)
                }
            )
            .onTapGesture {
                self.isSwitchOn.toggle()
            }
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SwitchView()
}
