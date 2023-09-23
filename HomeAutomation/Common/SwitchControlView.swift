//
//  SwitchControlView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 23/9/23.
//

import SwiftUI

struct SwitchControlView: View {
    @ObservedObject var viewModel: SwitchViewModel
    
    var body: some View {
        VStack {
            Button(action: {
                // Toggle the light switch
                self.viewModel.toggleSwitch("light")
            }) {
                Text("Toggle Light")
            }
            
            Button(action: {
                // Toggle the fan switch
                self.viewModel.toggleSwitch("fan")
            }) {
                Text("Toggle Fan")
            }
        }
        .padding()
        .onAppear {
            // Fetch initial data when the view appears
            viewModel.fetchData()
        }
    }
}

struct SwitchControlView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchControlView(viewModel: SwitchViewModel())
    }
}
