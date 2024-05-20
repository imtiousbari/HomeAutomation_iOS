//
//  CustomBtNv.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 30/12/23.
//

import SwiftUI

struct CustomBtNv: View {
    @State private var selectedTab = 0
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().tintColor = UIColor.white
        }
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab){
                HomeView()
                    .tag(0)
                Workinprogress()
                    .tag(1)
                QRCodeScannerView()
                    .tag(2)
                ProfileView()
                    .tag(3)
            }
            CustomBtNview(selectedTab: $selectedTab)
        }
    }
}

struct CustomBtNview: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.white)
                .frame(height: 90)
                .overlay(
                    HStack(spacing: 40) {
                        Button(action: {
                            selectedTab = 0
                        }) {
                            VStack {
                                Image(systemName: "house")
                                    .foregroundColor(selectedTab == 0 ? Color.Primary : .gray)
                                    .font(.system(size: 25)).bold()
                                Text("Home")
                                    .foregroundColor(selectedTab == 0 ? Color.Primary : .gray)
                                    .font(.system(size: 14)).bold()
                            }
                        }
                        .overlay(
                            Rectangle()
                                .frame(width: selectedTab == 0 ? 80 : 0, height: selectedTab == 0 ? 5 : 0)
                                .foregroundColor(Color.Primary)
                                .padding(.top, selectedTab == 0 ? -40 : 0)
                        )
                        Button(action: {
                            selectedTab = 1
                        }) {
                            VStack {
                                Image(systemName: "info.circle")
                                    .foregroundColor(selectedTab == 1 ? Color.Primary : .gray)
                                    .font(.system(size: 25)).bold()
                                Text("Control")
                                    .foregroundColor(selectedTab == 1 ? Color.Primary : .gray)
                                    .font(.system(size: 14)).bold()
                            }
                        }
                        .overlay(
                            Rectangle()
                                .frame(width: selectedTab == 1 ? 80 : 0, height: selectedTab == 1 ? 5 : 0)
                                .foregroundColor(Color.Primary)
                                .padding(.top, selectedTab == 1 ? -40 : 0)
                        )
                        Button(action: {
                            selectedTab = 2
                        }) {
                            VStack {
                                Image(systemName: "square.grid.2x2")
                                    .foregroundColor(selectedTab == 2 ? Color.Primary : .gray)
                                    .font(.system(size: 25)).bold()
                                Text("Automation")
                                    .foregroundColor(selectedTab == 2 ? Color.Primary : .gray)
                                    .font(.system(size: 14)).bold()
                            }
                        }
                        .overlay(
                            Rectangle()
                                .frame(width: selectedTab == 2 ? 80 : 0, height: selectedTab == 2 ? 5 : 0)
                                .foregroundColor(Color.Primary)
                                .padding(.top, selectedTab == 2 ? -40 : 0)
                        )
                        Button(action: {
                            selectedTab = 3
                        }) {
                            VStack {
                                Image(systemName: "person.fill")
                                    .foregroundColor(selectedTab == 3 ? Color.Primary : .gray)
                                    .font(.system(size: 25)).bold()
                                Text("Owner")
                                    .foregroundColor(selectedTab == 3 ? Color.Primary : .gray)
                                    .font(.system(size: 14)).bold()
                            }
                        }
                        .overlay(
                            Rectangle()
                                .frame(width: selectedTab == 3 ? 80 : 0, height: selectedTab == 3 ? 5 : 0)
                                .foregroundColor(Color.Primary)
                                .padding(.top, selectedTab == 3 ? -40 : 0)
                        )
                    }
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom, 10)
                )
        }
        .edgesIgnoringSafeArea(.all)
    }
}
#Preview {
    CustomBtNv()
}
