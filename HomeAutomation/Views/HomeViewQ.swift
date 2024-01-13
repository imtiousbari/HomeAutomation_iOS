//
//  Test.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 23/12/23.
//

import SwiftUI

struct HomeViewQ: View {
    var body: some View {
        VStack{
            Header2V()
        }
    }
}

struct Header2V: View {
    @State private var selectedTab = 0
    let tabTexts = ["My Home"]
    
    let tabViews: [AnyView] = [
        AnyView(SwitchContent()),
        AnyView(Workinprogress()),
        AnyView(Workinprogress()),
        AnyView(Workinprogress()),
        AnyView(Workinprogress())
       ]
    var body: some View {
        NavigationView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(0..<tabTexts.count) { index in
                                Text(tabTexts[index])
                                    .font(.system(size: 14))
                                
                                    .padding(10)
                                    .background(index == selectedTab ? Color.Primary : Color.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.white, lineWidth: 1)
                                            .opacity(index != selectedTab ? 1 : 0)
                                    )
                                    .foregroundColor(index == selectedTab ? .white : .black)
                                    .onTapGesture {
                                        selectedTab = index
                                    }
                                
                                AddNewCat()
                            }
                            
                            
                        }
                        .padding(.leading, 20)
                        .padding(.top,5)
                    }
                    TabView(selection: $selectedTab) {
                                            ForEach(0..<tabViews.count) { index in
                                                tabViews[index]
                                                    .tag(index)
                                            }
                                        }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
//                .offset(y: -30)
                .background(Color.Bg)
                .navigationBarHidden(true)
            }
    }
    
}


#Preview {
    HomeViewQ()
}

