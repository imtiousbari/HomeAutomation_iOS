//
//  customTabHorri.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 22/4/24.
//
import SwiftUI

struct GroupTab: View {
    @State private var selectedTab = 0
    let tabItems = ["My Home","New Tab 1", "New Tab 2", "+ New Group"]
       var body: some View {
           VStack(spacing: 0) {
               ScrollView(.horizontal, showsIndicators: false) {
                   HStack {
                       ForEach(0..<tabItems.count, id: \.self) { index in
                           if index == tabItems.count - 1 {
                               Button(action: {
                                   // Handle action for the last tab item
                                   // For example, show an alert
                                   print("Add new group tapped")
                               }) {
                                   Text(tabItems[index])
                                       .font(.system(size: 14))
                                       .foregroundColor(.white)
                                       .padding(10)
                                       .background(Color.Primary)
                                       .cornerRadius(10)
                               }
                           } else {
                               Button(action: {
                                   selectedTab = index
                               }) {
                                   Text(tabItems[index])
                                       .font(.system(size: 14))
                                       .padding(10)
                                       .background(selectedTab == index ? Color.Primary : Color.clear)
                                       .cornerRadius(10)
                                       .foregroundColor(selectedTab == index ? .white : .black)
                               }
                           }
                       }
                       .edgesIgnoringSafeArea(.all)
                   }
                   .padding(.horizontal)
               }
               
               TabView(selection: $selectedTab) {
                   RoomStchV()
                       .tag(0)
                   Workinprogress()
                       .tag(1)
                   Workinprogress()
                       .tag(2)
                   hello()
                       .tag(3)
               }
               .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
               .frame(maxWidth: .infinity, maxHeight: .infinity)
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color.Bg)
       }
       
     
   }

#Preview {
    GroupTab()
}
