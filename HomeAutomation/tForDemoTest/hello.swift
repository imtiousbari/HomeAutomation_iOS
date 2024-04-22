//
//  hello.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 22/4/24.
//

import SwiftUI

struct hello: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(0..<100) { _ in
                        Text("Hello, World!")
                            .padding()
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height) // Match ScrollView's frame to GeometryReader's frame
        }

//          ScrollView {
//              VStack(spacing: 10) {
//                  ForEach(0..<100) { _ in
//                      Text("Hello, World!")
//                          .padding()
//                  }
//              }
//          }
      }
}

#Preview {
    hello()
}
