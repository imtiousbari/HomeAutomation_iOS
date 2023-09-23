//
//  AppView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/9/23.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color(red: 0.06, green: 0.07, blue: 0.07)
                .ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 60) // Top padding for the image
                Image("bgImage") // Replace with the name of your image asset
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .alignmentGuide(.top, computeValue: { _ in 0 }) // Align to the top
                Spacer() // Spacer below the image
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                HeaderView()
                BannerView()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
