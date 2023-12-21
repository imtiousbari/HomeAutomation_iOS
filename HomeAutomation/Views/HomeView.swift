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
    }
}

struct HeroView: View {
    var body: some View {
        VStack {
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
                    .frame(width: 300, height: 150)
                    .padding(.leading,90)
                    .padding(.top,100)
                
                HStack{
                    Text("Hi, Nafiz Zaman")
                        .font(
                            Font.custom("Open Sans", size: 24)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity, alignment: .top)
                    Spacer()
                    Text("Hello")
                }
                .padding()
            }
        }
        .background(Color.Bg)
        .edgesIgnoringSafeArea(.all)
    }
}




struct Hero2View: View {
    var body: some View {
        VStack{
            HStack {
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
        }
    }
}

#Preview {
    HomeView()
}
