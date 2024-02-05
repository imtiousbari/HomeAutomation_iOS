//
//  SwiftUIView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 5/2/24.
//


import SwiftUI

struct Room: Identifiable, Decodable {
    let id: Int
    let roomName: String
    let status: Int
}

struct RoomsData: Decodable {
    let rooms: [Room]
}

struct SwiftUIView: View {
    @State private var rooms: [Room] = []

    var body: some View {
        VStack(alignment: .leading) {
            Text("Quick Access")
                .fontWeight(.bold)
                .font(.title3)
                .padding(.leading)
                .padding(.top)
                .padding(.bottom, -15)
                .foregroundColor(.black)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 0)], spacing: 0) {
                    ForEach(rooms) { room in
                                    RoomViewN(room: room)
                                        .padding(8)
                                }
                }
                
                Spacer()
            }
            .padding()
        }
        .background(Color.Bg)
//        VStack {
//            ForEach(rooms) { room in
//                RoomViewN(room: room)
//                    .padding()
//            }
//        }
        .onAppear {
            loadData()
        }
    }

    func loadData() {
        if let fileURL = Bundle.main.url(forResource: "QuickAcsRooms", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let roomsData = try decoder.decode(RoomsData.self, from: data)

                rooms = roomsData.rooms

                // Print to verify data
                print(rooms)
            } catch {
                print("Error loading data: \(error)")
            }
        }
    }
}

//struct RoomView: View {
//    let room: Room
//
//    var body: some View {
//        VStack {
//            Text(room.roomName)
//                .font(.title)
//                .padding()
//
//            if room.status == 1 {
//                Text("On")
//                    .foregroundColor(.green)
//            } else {
//                Text("Off")
//                    .foregroundColor(.red)
//            }
//        }
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(radius: 5)
//    }
//}
struct RoomViewN: View {
    let room: Room
    var body: some View {
        if room.status == 1 {
        Rectangle()
        .frame(width: 170, height: 120) 
                .foregroundColor(Color.Primary)
                .cornerRadius(15)
                .overlay(
                    VStack {
                        HStack {
                            Image("4gangswthL")
                                .resizable()
                                .frame(width:20, height: 20)
                            Spacer()
                            Image(systemName: "power.circle")
                                .font(.system(size: 20))
                                .foregroundColor(.green)
                                .onTapGesture {
//                                    self.isSwitchOn.toggle()
                                }
                        }
                        .padding(15)
                        Spacer()
                        HStack {
                            Text(room.roomName)
                                .foregroundColor( .white)
                                .font(.system(size: 14))
                            Spacer()
                            Text("On")
//                            Text(isSwitchOn ? "ON" : "OFF")
                                .foregroundColor(Color.CusYellow)
                                .font(.system(size: 14))
                        }
                        .padding()
    //                    .padding(.bottom, 10)
                    }
                )
        } else {
            Rectangle()
            .frame(width: 170, height: 120) 
                .foregroundColor(Color.white)
                .cornerRadius(15)
                .overlay(
                    VStack {
                        HStack {
                            Image("4gangswth")
                                .resizable()
                                .frame(width:20, height: 20)
                            Spacer()
                            Image(systemName: "power.circle")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .onTapGesture {
//                                    self.isSwitchOn.toggle()
                                }
                        }
                        .padding(15)
                        Spacer()
                        HStack {
                            Text(room.roomName)
//                                .foregroundColor(isSwitchOn ? .white : .black)
                                .font(.system(size: 12))
                            Spacer()
//                            Text(isSwitchOn ? "ON" : "OFF")
//                                .foregroundColor(isSwitchOn ? Color.CusYellow : .green)
                            Text("Off")
//                            Text(isSwitchOn ? "ON" : "OFF")
                                .foregroundColor(Color.red)
                                .font(.system(size: 12))
                        }
                        .padding()
    //                    .padding(.bottom, 10)
                    }
                )
        }
    }
}

//struct SwitchView: View {
//    @State private var isSwitchOn = false
//
//    var body: some View {
//        Rectangle()
//            .frame(width: 170, height: 120)
//            .foregroundColor(isSwitchOn ? Color.Primary : .white)
//            .cornerRadius(15)
//            .overlay(
//                VStack {
//                    HStack {
//                        Image(isSwitchOn ? "4gangswthL" : "4gangswth")
//                            .resizable()
//                            .frame(width:20, height: 20)
////                        Image(systemName: isSwitchOn ? "lightbulb.max.fill" : "lightbulb")
////                            .font(.system(size: isSwitchOn ? 15 : 20))
////                            .foregroundColor(isSwitchOn ? .white : .black)
//                        Spacer()
//                        Image(systemName: "power.circle")
//                            .font(.system(size: 20))
//                            .foregroundColor(isSwitchOn ? .green : .black)
//                            .onTapGesture {
//                                self.isSwitchOn.toggle()
//                            }
//                    }
//                    .padding(15)
//                    Spacer()
//                    HStack {
//                        Text("Room 01:")
//                            .foregroundColor(isSwitchOn ? .white : .black)
//                            .font(.system(size: 12))
//                        Spacer()
//                        Text(isSwitchOn ? "ON" : "OFF")
//                            .foregroundColor(isSwitchOn ? Color.CusYellow : .green)
//                            .font(.system(size: 12))
//                    }
//                    .padding()
////                    .padding(.bottom, 10)
//                }
//            )
//            .onTapGesture {
//                self.isSwitchOn.toggle()
//            }
//            .edgesIgnoringSafeArea(.all)
//    }
//}



#Preview {
    SwiftUIView()
}
