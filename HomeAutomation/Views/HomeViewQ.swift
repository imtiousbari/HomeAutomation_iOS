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
    @State var showingAlert = false
    let tabTexts = ["My Home", "Add New Group", "New Tab 1", "New Tab 2"]
    
    let tabViews: [AnyView] = [
        AnyView(SwitchContent()),
        //        AnyView(AddNewCat()),
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
                            if tabTexts[index] == "Add New Group"{
                                //                                    AddNewCat()
                                
//                                Button("Show Alert") {
//                                    showingAlert = true
//                                }
//                                .alert("Important message", isPresented: $showingAlert) {
//                                    Button("OK", role: .cancel) { }
//                                }
                                
                                                                    Button(action: {
                                                                        showingAlert = true
                                                                        //            AddNewGrp()
                                                                        //                                        Alert(title: <#T##Text#>("Test"))
                                                                        print("Show", showingAlert)
                                
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
                                //                                AddNewCat()
                                //                                    AddNewCat()
                                //                                    .zIndex(99.00)
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
            
        }
                ModalAddGroup(isShowing: $showingAlert)
        //            .background(Color.red)
    }
    
}


#Preview {
    HomeViewQ()
}

