//
//  MultiNav.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 15/2/24.
//

import SwiftUI

struct MultiNav: View {
    var body: some View {
        NavigationView {
            FirstColumnView()
            SecondColumnView()
            ThirdColumnView()
        }
    }
}

struct NewHomeView: View {
    var body: some View {
        NavigationView {
            HomeView()
        }
    }
}



struct FirstColumnView: View {
    var body: some View {
        List {
            Text("First Column")  
            NavigationLink("Open Next View") {
                SecondColumnView()
            }
        }
        .navigationTitle("First Navigation Title")
    }
}
struct SecondColumnView: View {
    var body: some View {
        VStack {
            Text("Second Column View")
                .font(.title)
            
            NavigationLink("Open Next View") {
                ThirdColumnView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.opacity(0.3))
        .navigationTitle("Second Navigation Title")
    }
}

struct ThirdColumnView: View {
    var body: some View {
        Text("Third Column View")
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.mint.opacity(0.5))
            .navigationTitle("Third Navigation Title")
    }
}

#Preview {
    MultiNav()
//    NewHomeView()
}
