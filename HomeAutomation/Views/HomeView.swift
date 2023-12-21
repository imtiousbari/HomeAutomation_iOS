//
//  HomeView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 19/12/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            HeroView()
            Spacer()
        }
        .background(Color.Bg)
    }
}

struct HeroView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottom){
                ZStack{
                    Rectangle()
                        .frame(width: 400, height: 250)
                        .cornerRadius(20)
                        .foregroundColor(Color.Primary)
                        .overlay(
                            VStack{
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
                                    ProfileButton()
                                }
                                
                                .padding(.bottom,100)
                            }
                                .foregroundColor(.white)
                                .padding()
                        )
                    Image("IsolationMode")
                        .resizable()
                        .frame(width: 250, height: 140)
                        .padding(.leading,130)
                        .padding(.bottom,-150)
                    
                    
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
                    .padding(.top, 30)
                    .padding()
                }
                Hero2View()
                    .offset(y: 50)
            }
        }
        .background(Color.Bg)
        .edgesIgnoringSafeArea(.all)
    }
}




struct Hero2View: View {
    var body: some View {
        HStack {
            CardView(imageName: "sun", text: "Get up")
            CardView(imageName: "moon", text: "Good night")
            CardView(imageName: "goout", text: "Go out")
        }
    }
}

#Preview {
    HomeView()
}
