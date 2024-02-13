////
////  SwiftUIView.swift
////  HomeAutomation
////
////  Created by Imtious Bari on 5/2/24.
////
//
//
//import SwiftUI
//
//struct Room: Identifiable, Decodable {
//    let id: Int
//    let roomName: String
//    let status: Int
//}
//
//struct RoomsData: Decodable {
//    let rooms: [Room]
//}
//
//struct SwiftUIView: View {
//    @State private var rooms: [Room] = []
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Quick Access")
//                .fontWeight(.bold)
//                .font(.title3)
//                .padding(.leading)
//                .padding(.top)
//                .padding(.bottom, -15)
//                .foregroundColor(.black)
//            ScrollView(.vertical, showsIndicators: false) {
//                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 0)], spacing: 0) {
//                    ForEach(rooms) { room in
//                        RoomViewN(room: room)
//                            .padding(8)
//                    }
//                }
//                
//                Spacer()
//            } //
//            .padding()
//        }
//        .background(Color.Bg)
//        .onAppear {
//            loadData()
//        }
//    }
    
//    func loadData() {
////        if let fileURL = Bundle.main.url(forResource: "QuickAcsRooms", withExtension: "json") {
//        if let fileURL = Bundle.main.url(forResource: "switch", withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: fileURL)
//                let decoder = JSONDecoder()
//                let roomsData = try decoder.decode(RoomsData.self, from: data)
//                
//                rooms = roomsData.rooms
//                
//                // Print to verify data
//                print(rooms)
//            } catch {
//                print("Error loading data: \(error)")
//            }
//        }
//    }
//}
//
//
//
////struct RoomViewN: View {
////    let room: Room
////    
////    var body: some View {
////        Rectangle()
////            .frame(width: 170, height: 120)
////            .cornerRadius(15)
////            .overlay(
////                VStack {
////                    HStack {
////                        Image(room.status == 1 ? "4gangswthL" : "4gangswth")
////                            .resizable()
////                            .frame(width: 20, height: 20)
////                        Spacer()
////                        Image(systemName: "power.circle")
////                            .font(.system(size: 20))
////                            .foregroundColor(room.status == 1 ? .green : .black)
////                            .onTapGesture {
////                                // Handle tap gesture
////                                print("Error loading data: ")
////                            }
////                    }
////                    .padding(15)
////                    Spacer()
////                    HStack {
////                        Text(room.roomName)
////                            .foregroundColor(room.status == 1 ? .white : .black)
////                            .font(.system(size: 14))
////                        Spacer()
////                        Text(room.status == 1 ? "On" : "Off")
////                            .foregroundColor(room.status == 1 ? .CusYellow : .red)
////                            .font(.system(size: 14))
////                    }
////                    .padding()
////                }
////            )
////            .foregroundColor(room.status == 1 ? .Primary : .white)
////    }
////}
//
//struct RoomViewN: View {
//    let room: Room
//    
//    var body: some View {
//        NavigationLink(destination: SwitchesView(room: room)) {
//            Rectangle()
//                .frame(width: 170, height: 120)
//                .cornerRadius(15)
//                .overlay(
//                    VStack {
//                        HStack {
//                            Image(room.status == 1 ? "4gangswthL" : "4gangswth")
//                                .resizable()
//                                .frame(width: 20, height: 20)
//                            Spacer()
//                            Image(systemName: "power.circle")
//                                .font(.system(size: 20))
//                                .foregroundColor(room.status == 1 ? .green : .black)
//                        }
//                        .padding(15)
//                        Spacer()
//                        HStack {
//                            Text(room.roomName)
//                                .foregroundColor(room.status == 1 ? .white : .black)
//                                .font(.system(size: 14))
//                            Spacer()
//                            Text(room.status == 1 ? "On" : "Off")
//                                .foregroundColor(room.status == 1 ? .CusYellow : .red)
//                                .font(.system(size: 14))
//                        }
//                        .padding()
//                    }
//                )
//                .foregroundColor(room.status == 1 ? .Primary : .white)
//        }
//        .buttonStyle(PlainButtonStyle()) // to remove the default button style
//    }
//}
//
//struct SwitchesView: View {
//    let room: Room
//    
//    var body: some View {
//        // Your switches view implementation goes here
//        Text("Switches for \(room.roomName)")
//            .navigationBarTitle("Switches")
//    }
//}
//
//
//
//#Preview {
//    SwiftUIView()
//}
