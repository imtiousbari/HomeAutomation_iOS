////
////  CustomBtNv.swift
////  HomeAutomation
////
////  Created by Imtious Bari on 30/12/23.
////
//
//import SwiftUI
//
//struct CustomBottomBar: View {
//    @State private var selectedTab = 0
//
//    let tabs: [TabItem]
//
//    var body: some View {
//        VStack(spacing: 0) {
//            TabView(selection: $selectedTab) {
//                ForEach(tabs.indices, id: \.self) { index in
//                    tabs[index].content
//                        .tag(index)
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//
//            HStack(spacing: 0) {
//                ForEach(tabs.indices, id: \.self) { index in
//                    Button(action: {
//                        withAnimation {
//                            selectedTab = index
//                        }
//                    }) {
//                        VStack {
//                            Image(systemName: tabs[index].imageName)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 30, height: 30)
//                                .padding(10)
//                                .foregroundColor(selectedTab == index ? Color.blue : Color.gray)
//                            Text(tabs[index].name)
//                                .font(.footnote)
//                                .foregroundColor(selectedTab == index ? Color.blue : Color.gray)
//                        }
//                    }
//                }
//
//                // Indicator line
//                GeometryReader { geometry in
//                    Capsule()
//                        .frame(width: geometry.size.width / CGFloat(tabs.count), height: 2)
//                        .offset(x: CGFloat(selectedTab) * (geometry.size.width / CGFloat(tabs.count)))
//                        .foregroundColor(Color.blue)
//                }
//                .frame(height: 2)
//                .animation(.easeInOut)
//            }
//        }
//    }
//}
//
//struct TabItem {
//    let imageName: String
//    let name: String
//    let content: some View
//
//    init(imageName: String, name: String, content: @autoclosure () -> some View) {
//        self.imageName = imageName
//        self.name = name
//        self.content = content()
//    }
//}
//
//struct CustomBtNv: View {
//    let tabs: [TabItem] = [
//        TabItem(imageName: "house", name: "Home", content: Text("Home Content")),
//        TabItem(imageName: "star", name: "Favorites", content: Text("Favorites Content")),
//        TabItem(imageName: "gear", name: "Settings", content: Text("Settings Content")),
//    ]
//
//    var body: some View {
//        CustomBottomBar(tabs: tabs)
//    }
//}
//
////struct CustomBtNv_Previews: PreviewProvider {
////    static var previews: some View {
////        CustomBtNv()
////    }
////}
//
//#Preview {
//    CustomBtNv()
//}
