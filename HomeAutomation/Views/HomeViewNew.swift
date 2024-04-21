//
//  HomeViewNew.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/4/24.
//

import SwiftUI

struct HomeViewNew: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: FirstDetailView()) {
                    Text("Go to First Detail View")
                }
                NavigationLink(destination: SecondDetailView()) {
                    Text("Go to Second Detail View")
                }
            }
            .navigationTitle("Main Page")
        }
    }
}

struct FirstDetailView: View {
    var body: some View {
        VStack {
            Text("First Detail View")
            NavigationLink(destination: ThirdDetailView()) {
                Text("Go to Third Detail View")
            }
        }
        .navigationTitle("First Detail")
    }
}

struct SecondDetailView: View {
    var body: some View {
        Text("Second Detail View")
            .navigationTitle("Second Detail")
    }
}

struct ThirdDetailView: View {
    var body: some View {
        Text("Third Detail View")
            .navigationTitle("Third Detail")
    }
}


#Preview {
    HomeViewNew()
}
