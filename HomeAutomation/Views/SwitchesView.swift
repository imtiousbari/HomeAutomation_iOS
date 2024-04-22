//
//  SwitchesView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/4/24.
//

import SwiftUI

struct SwitchesView: View {
    let room: Room
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                List(room.switches) { switchItem in
                    HStack {
                        Text(switchItem.name)
                        Spacer()
                        Image(systemName: switchItem.status == 1 ? "lightbulb.fill" : "lightbulb")
                            .foregroundColor(switchItem.status == 1 ? .yellow : .gray)
                    }
                    .padding()
                }
            }
            .toolbarBackground(

                            // 1
                            Color.Primary,
                            // 2
                            for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .navigationBarTitle("\(room.roomName) Switches")
        .navigationBarTitleColor(.white)
        .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: NavBackButton())
        .preferredColorScheme(.light)
//        .edgesIgnoringSafeArea(.all)
        
    }
}

