//
//  Test.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 23/12/23.
//

import SwiftUI

struct HomeViewQ: View {
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            VStack{
                Header2V()
            }
//
        }
    }
}

struct Header2V: View {
//    @Binding var isShowingAlert: Bool
    @State private var selectedTab = 0
    @State var showingAlert = false
    let tabTexts = ["My Home","New Tab 1", "New Tab 2", "+ New Group"]
    
    let tabViews: [AnyView] = [
        AnyView(SwitchContent()),
        AnyView(Workinprogress()),
        AnyView(Workinprogress()),
        AnyView(Workinprogress())
    ]
    var body: some View {
        NavigationView {
            ZStack{
                
                
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(0..<tabTexts.count) { index in
                                if tabTexts[index] == "+ New Group"{
                                    Button(action: {
                                        showingAlert = true
                                        //                                    print("Show", showingAlert)
                                    }) {
                                        Text(tabTexts[index])
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                            .padding(10)
                                            .background(Color.white)
                                            .cornerRadius(10)
                                    }
                                }
                                else{
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
                                }
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
//                BottomSheet(isShowing: $showingAlert)
                .overlay(
                                    BottomSheet(isShowing: $showingAlert)
                                        .padding(.bottom,20)
                                        .edgesIgnoringSafeArea(.all)
                                )
//                    .padding(.bottom,20)
//                    .background(Color.Bg)
            }
            
        }
//        ModalAddGroup(isShowing: $showingAlert)
       
    }
    
}


#Preview {
    HomeViewQ()
}

