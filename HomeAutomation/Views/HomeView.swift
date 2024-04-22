//
//  HomeView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 19/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isShowingDetailView = false
    @State private var image: Image = Image("pp")
    @State private var showingAlert = false
    @State private var selectedTab = 0
    let tabItems = ["My Home","New Tab 1", "New Tab 2", "+ New Group"]
        var body: some View {
        NavigationView {
                    VStack {
                ZStack {
                    Color.Primary
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Image("IsolationMode")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 50)
                            .foregroundColor(.white)
                            .padding()
                            .offset( x:50, y: 180)
                        
                        //weather
                        HStack {
                            HStack(alignment: .center) {
                                Image("SunWeater")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("28°C")
                                    .font(.system(size: 14))
                            }
                            HStack(alignment: .center) {
                                Image("humidity")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("28°C")
                                    .font(.system(size: 14))
                                
                            }
                            HStack(alignment: .center) {
                                Image("calendar")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("Wed, May 24th")
                                    .font(.system(size: 14))
                            }
                            Spacer()
                            VStack {
                                NavigationLink(
                                    destination: ProfileView(),
                                    isActive: $isShowingDetailView
                                ) {
//                                    EmptyView()
                                }
                                .hidden()
                                
                                Button(action: {
                                    isShowingDetailView = true
                                }) {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                        .background(Circle().foregroundColor(Color.white))
                                        .shadow(radius: 4)
                                }
                            }
                            .navigationBarBackButtonHidden(true)
                        }
                        
                        HStack {
                            
                            Text("Hi, Nafiz Zaman")
                                .font(Font.custom("Open Sans", size: 24).weight(.bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "bell.badge.fill")
                                .resizable()
                                .frame(width: 20, height: 25)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 50)
                    }
                    .padding(.bottom, 80)
                    .padding()
                }
//                .edgesIgnoringSafeArea(.all)
                .frame(width: 400, height: 250)
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                .foregroundColor(Color.white)
                
//                Spacer()
                
                HStack {
                    CardView(imageName: "sun", text: "Get up")
                    CardView(imageName: "moon", text: "Good night")
                    CardView(imageName: "goout", text: "Go out")
                }
                .offset(y: -60)
                
//                ZStack {
                    VStack {
                        VStack(spacing: 0) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<tabItems.count, id: \.self) { index in
                                        if index == tabItems.count - 1 {
                                            Button(action: {
                                                // Handle action for the last tab item
                                                // For example, show an alert
                                                showingAlert = true
                                                print("Add new group tapped")
                                            }) {
                                                Text(tabItems[index])
                                                    .font(.system(size: 14))
                                                    .foregroundColor(selectedTab == index ? .white : .black)                                                    .padding(10)
                                                    .background(selectedTab == index ? Color.Primary : Color.white)
                                                    .cornerRadius(10)
                                            }
                                    
                                        } else {
                                            Button(action: {
                                                selectedTab = index
                                            }) {
                                                Text(tabItems[index])
                                                    .font(.system(size: 14))
                                                    .padding(10)
                                                    .background(selectedTab == index ? Color.Primary : Color.white)
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
                    .background(Color.Bg)
                    .navigationBarBackButtonHidden(true)
                .offset(y: -40)
            }
            .edgesIgnoringSafeArea(.all)
            .background(Color.Bg)
            
        }
        
        
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(false)
        .overlay(
            
            BottomSheet(isShowing: $showingAlert)
//                .padding(.bottom, 20)
//                .edgesIgnoringSafeArea(.all)
        )
        
        
    }
}
#Preview {
    HomeView()
}
