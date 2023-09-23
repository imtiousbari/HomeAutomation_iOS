//
//  BannerView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 22/9/23.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            VStack{
                
                Text("MD's Room")
                .font(
                Font.custom("General Sans Variable", size: 18)
                .weight(.semibold)
                )
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                
                // Mobile/Body - 14pt/Body - Regular
                Text("3 devices")
                  .font(Font.custom("Noto Sans", size: 14))
                  .foregroundColor(Color(red: 0.85, green: 0.87, blue: 0.9))
                  .frame(maxWidth: .infinity, alignment: .bottomLeading)
            }
            .padding(.leading, 10)
            ZStack {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 200, height: 200)
                  .background(Color(red: 0.38, green: 0.41, blue: 0.45))
                  .cornerRadius(263)
                
                Spacer()
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 180, height: 180)
                  .background(
                    Image("MDRoom")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 227, height: 231)
                      .clipped()
                  )
                  .cornerRadius(231)
                
            }
            .frame(width: 224, height: 185).padding(.trailing, -30)
            

         

            

        }
//        .padding(.top, 0)
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
