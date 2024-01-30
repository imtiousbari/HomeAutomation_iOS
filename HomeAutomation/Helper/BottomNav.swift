//
//  BottomNav.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 28/12/23.
//

import SwiftUI

struct BottomNav: View {
    @State private var selectedTab = 0
     
     var body: some View {
        
             VStack(spacing: 0) {
                 TabView(selection: $selectedTab) {
                     demo()
                         .tabItem {
                             Image(systemName: "house")
                             Text("Home")
                         }
                         .tag(0)
                     
                     CusBootmSheet()
                         .tabItem {
                             Image(systemName: "info.circle")
                             Text("Control")
                         }
                         .tag(1)
                     
                     Workinprogress()
                         .tabItem {
                             Image(systemName: "square.grid.2x2")
                             Text("Automation")
                         }
                         .tag(2)
                     
                     Workinprogress()
                         .tabItem {
                             Image(systemName: "envelope")
                             Text("Owners")
                         }
                         .tag(3)
                 }
//                 .background(Color.red)
                 .accentColor(Color.Primary)
                 .colorScheme(.light)
//                 Spacer()
             }
//             .foregroundColor(.white)
//             .background(Color.white.edgesIgnoringSafeArea(.all))
     }
     
 }


#Preview {
    BottomNav()
}

