//
//  NavbackButton.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 29/1/24.
//

import SwiftUI

struct NavbackButton: View {
    
    var body: some View {
        
                Button(action: {
                    // Handle back button action
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(.white) // Change the color of the back button
                }
            }
    }

#Preview {
    NavbackButton()
}
