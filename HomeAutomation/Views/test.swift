//
//  test.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 28/1/24.
//

import SwiftUI


struct demo:View {
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
                            .offset( x:50, y: 80)
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
//                                .buttonStyle(PlainButtonStyle())
                            }
//                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)

                            
                        }
//                        .padding(.bottom, 80)
                        //name
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
                .navigationViewStyle(StackNavigationViewStyle())
                                Spacer()
                //                Hero2View()
                
                //cardview
                HStack {
                    CardView(imageName: "sun", text: "Get up")
                    CardView(imageName: "moon", text: "Good night")
                    CardView(imageName: "goout", text: "Go out")
                }
                .offset(y:-60)
//                HomeViewQ()
                Header2V()
//                    .zIndex(2)
                .offset(y:-50)
            }
            .edgesIgnoringSafeArea(.all)
            .background(Color.Bg)
            
        }
        
    }
    
}

#Preview {
    demo()
}
