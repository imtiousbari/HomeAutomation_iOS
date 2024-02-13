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
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    Color.Primary
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Image("IsolationMode")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 50)
                            .foregroundColor(.white)
                            .padding()
                            .offset( x:50, y: 180)
                        //weather
                        HStack{
                            HStack(alignment: .center){
                                Image("SunWeater")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("28°C")
                                    .font(.system(size: 14))
                            }
                            HStack(alignment: .center){
                                Image("humidity")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("28°C")
                                    .font(.system(size: 14))
                                
                            }
                            HStack(alignment: .center){
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
                                    EmptyView()
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
                        HStack{
                            
                            Text("Hi, Nafiz Zaman")
                                .font(
                                    Font.custom("Open Sans", size: 24)
                                        .weight(.bold)
                                )
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
                .edgesIgnoringSafeArea(.all)
                .frame(width: 400, height: 250)
                .cornerRadius(20, corners: [/*.topLeft, .topRight,*/ .bottomLeft, .bottomRight])
                .foregroundColor(Color.white)
//                .navigationViewStyle(StackNavigationViewStyle())
                Spacer()
                //                Hero2View()
                
                //cardview
                HStack {
                    CardView(imageName: "sun", text: "Get up")
                    CardView(imageName: "moon", text: "Good night")
                    CardView(imageName: "goout", text: "Go out")
                }
                .offset(y:-60)
                
                Header2V()
//                RoomStchV()
                    .offset(y:-50)
                

            }
            .edgesIgnoringSafeArea(.all)
            .background(Color.Bg)
            
        }
        
    }
}


struct Header2V: View {
    @State private var showingAlert = false
    @State private var selectedTab = 0
    let tabTexts = ["My Home","New Tab 1", "New Tab 2", "+ New Group"]
    
    let tabViews: [AnyView] = [
        AnyView(RoomStchV()),
        AnyView(Workinprogress()),
        AnyView(Workinprogress()),
        AnyView(Workinprogress())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(0..<tabTexts.count, id: \.self) { index in
                                if tabTexts[index] == "+ New Group" {
                                    Button(action: {
                                        showingAlert = true
                                    }) {
                                        Text(tabTexts[index])
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                            .padding(10)
                                            .background(Color.white)
                                            .cornerRadius(10)
                                    }
                                } else {
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
//                            .padding(.leading,20)
                            .padding(.top,5)
                        }
                    }
                    .padding(.leading)
                    TabView(selection: $selectedTab) {
                        ForEach(0..<tabViews.count, id: \.self) { index in
                            tabViews[index]
                                .tag(index)
                                .onAppear {
                                    print("Current index: \(index)")
                                }
                        }
                    }
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                }
                .background(Color.Bg)
                .navigationBarHidden(true)
                .overlay(
                    BottomSheet(isShowing: $showingAlert)
                        .padding(.bottom,20)
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
    }
}

//struct SwitchContent: View {
//    var body: some View {
//        
//        VStack(alignment: .leading) {
//            Text("Quick Access")
//                .fontWeight(.bold)
//                .font(.title3)
//                .padding(.leading)
//                .padding(.top)
//                .padding(.bottom, -15)
//                .foregroundColor(.black)
//            ScrollView(.vertical, showsIndicators: false) {
//                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
//                    ForEach(0..<5) { index in
//                        SwitchView()
//                    }
//                }
//                
//                Spacer()
//            }
//            .padding()
//        }
//    }
//}



#Preview {
    HomeView()
}
