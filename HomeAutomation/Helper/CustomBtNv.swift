//
//  CustomBtNv.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 30/12/23.
//

import SwiftUI

struct CustomBtNv: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                Workinprogress()
                    .tag(1)
                Workinprogress()
                    .tag(2)
                ProfileView()
                    .tag(3)
            }
            
            CustomBtNview(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
struct CustomBtNview: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .fill(Color.white)
                .frame(height: 90)
                .overlay(
                    HStack(spacing: 40) {
                        Button(action: {
                            selectedTab = 0
                        }) {
                            VStack {
                                Image(systemName: "house")
                                    .foregroundColor(selectedTab == 0 ? Color.primary : .gray)
                                    .font(.system(size: 25)).bold()
                                Text("Home")
                                    .foregroundColor(selectedTab == 0 ? Color.primary : .gray)
                                    .font(.system(size: 14)).bold()
                            }
                        }
                        .overlay(
                            Rectangle()
                                .frame(width: selectedTab == 0 ? 80 : 0, height: selectedTab == 0 ? 5 : 0)
                                .foregroundColor(Color.primary)
                                .padding(.top, selectedTab == 0 ? -40 : 0)
                        )
                        Button(action: {
                            selectedTab = 1
                        }) {
                            VStack {
                                Image(systemName: "info.circle")
                                    .foregroundColor(selectedTab == 1 ? Color.primary : .gray)
                                    .font(.system(size: 25)).bold()
                                Text("Control")
                                    .foregroundColor(selectedTab == 1 ? Color.primary : .gray)
                                    .font(.system(size: 14)).bold()
                            }
                        }
                        .overlay(
                            Rectangle()
                                .frame(width: selectedTab == 1 ? 80 : 0, height: selectedTab == 1 ? 5 : 0)
                                .foregroundColor(Color.primary)
                                .padding(.top, selectedTab == 1 ? -40 : 0)
                        )
                        Button(action: {
                            selectedTab = 2
                        }) {
                            VStack {
                                Image(systemName: "square.grid.2x2")
                                    .foregroundColor(selectedTab == 2 ? Color.primary : .gray)
                                    .font(.system(size: 25)).bold()
                                Text("Automation")
                                    .foregroundColor(selectedTab == 2 ? Color.primary : .gray)
                                    .font(.system(size: 14)).bold()
                            }
                        }
                        .overlay(
                            Rectangle()
                                .frame(width: selectedTab == 2 ? 80 : 0, height: selectedTab == 2 ? 5 : 0)
                                .foregroundColor(Color.primary)
                                .padding(.top, selectedTab == 2 ? -40 : 0)
                        )
                        Button(action: {
                            selectedTab = 3
                        }) {
                            VStack {
                                Image(systemName: "person.fill")
                                    .foregroundColor(selectedTab == 3 ? Color.primary : .gray)
                                    .font(.system(size: 25)).bold()
                                Text("Owner")
                                    .foregroundColor(selectedTab == 3 ? Color.primary : .gray)
                                    .font(.system(size: 14)).bold()
                            }
                        }
                        .overlay(
                            Rectangle()
                                .frame(width: selectedTab == 3 ? 80 : 0, height: selectedTab == 3 ? 5 : 0)
                                .foregroundColor(Color.primary)
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

//struct CustomBtNview: View {
//    @State private var selectedImage: String?
//    @Binding var selectedTab: Int
//    var body: some View {
//        VStack {
//            Spacer()
//            RoundedRectangle(cornerRadius: 0, style: .continuous)
//                .fill(Color.white)
//                .frame(height: 90)
//                .overlay(
//                    HStack(spacing: 40) {
//                        Button(action: {
//                            selectedImage = "house"
//                            selectedTab = 0
//                        }) {
//                            VStack {
//                                Image(systemName: "house")
//                                    .foregroundColor(selectedImage == "house" ? Color.Primary : .gray)
//                                    .font(.system(size: 25)).bold()
//                                Text("Home")
//                                    .foregroundColor(selectedImage == "house" ? Color.Primary : .gray)
//                                    .font(.system(size: 14)).bold()
//                            }
//                        }
//                        .overlay(
//                            Rectangle()
//                                .frame(width: selectedTab == 0 ? 80 : 0, height: selectedTab == 0 ? 5 : 0) // Check selectedTab instead of selectedImage
//                                .foregroundColor(Color.Primary)
//                                .padding(.top, selectedTab == 0 ? -40 : 0) // Check selectedTab instead of selectedImage
//                        )
//                        Button(action: {
//                            selectedTab = 1
//                            selectedImage = "info.circle"
//                        }) {
//                            VStack {
//                                Image(systemName: "info.circle")
//                                    .foregroundColor(selectedImage == "info.circle" ? Color.Primary : .gray)
//                                    .font(.system(size: 25)).bold()
//                                Text("Control")
//                                    .foregroundColor(selectedImage == "info.circle" ? Color.Primary : .gray)
//                                    .font(.system(size: 14)).bold()
//                            }
//                        }
//                        .overlay(
//                            Rectangle()
//                                .frame(width:  selectedImage == "info.circle" ? 80 : 0 ,height: selectedImage == "info.circle" ? 5 : 0)
//                                .foregroundColor(Color.Primary)
//                                .padding(.top, selectedImage == "info.circle" ? -40 : 0)
//                        )
//                        Button(action: {
//                            selectedImage = "square.grid.2x2"
//                            selectedTab = 2
//                        }) {
//                            VStack {
//                                Image(systemName: "square.grid.2x2")
//                                    .foregroundColor(selectedImage == "square.grid.2x2" ? Color.Primary : .gray)
//                                    .font(.system(size: 25)).bold()
//                                Text("Automation")
//                                    .foregroundColor(selectedImage == "square.grid.2x2" ? Color.Primary : .gray)
//                                    .font(.system(size: 14)).bold()
//                            }
//                        }
//                        .overlay(
//                            Rectangle()
//                                .frame(width:  selectedImage == "square.grid.2x2" ? 80 : 0 ,height: selectedImage == "square.grid.2x2" ? 5 : 0)
//
//                                .foregroundColor(Color.Primary)
//                                .padding(.top, selectedImage == "square.grid.2x2" ? -40 : 0)
//                        )
//                        Button(action: {
//                            selectedImage = "person.fill"
//                            selectedTab = 3
//                        }) {
//                            VStack {
//                                Image(systemName: "person.fill")
//                                    .foregroundColor(selectedImage == "person.fill" ? Color.Primary : .gray)
//                                    .font(.system(size: 25)).bold()
//                                
//                                Text("Owner")
//                                    .foregroundColor(selectedImage == "person.fill" ? Color.Primary : .gray)
//                                    .font(.system(size: 14)).bold()
//                            }
//                        }
//                        .overlay(
//                            Rectangle()
//                                .frame(width:  selectedImage == "person.fill" ? 80 : 0 ,height: selectedImage == "person.fill" ? 5 : 0)
//                                .foregroundColor(Color.Primary)
//                                .padding(.top, selectedImage == "person.fill" ? -40 : 0)
//                        )
//                    }
//                        .padding([.leading, .trailing], 10)
////                        .padding([.top, .bottom],10)
//                        .padding(.bottom, 10)
//                )
//        }
//        
//        .edgesIgnoringSafeArea(.all)
//    }
//}


#Preview {
    CustomBtNv()
}
