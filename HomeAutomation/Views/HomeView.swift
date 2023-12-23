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
            Hero2View()
            HomeViewQ()
//            Spacer()
            
        }
        .background(Color.Bg)
    }
}

struct HeroView: View {
    var body: some View {
            ZStack {
                Color.Primary
                    .edgesIgnoringSafeArea(.all)
                             
                Image("IsolationMode")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .padding()
                    .offset( x:30, y: 80)
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
//                    .padding()
                    
                }
                .foregroundColor(.white)
                .padding()
                .padding(.bottom,50)
            }
            .frame(width: 400, height: 250)
            .cornerRadius(20)
//            .edgesIgnoringSafeArea(.all)
        }
    }

struct Hero2View: View {
    var body: some View {
        HStack {
            CardView(imageName: "sun", text: "Get up")
            CardView(imageName: "moon", text: "Good night")
            CardView(imageName: "goout", text: "Go out")
        }
        .padding(.bottom,10)
        .padding(.top, -70)
    }
}


#Preview {
    HomeView()
}
