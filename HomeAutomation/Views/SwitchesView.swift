//
//  SwitchesView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/4/24.
//

import SwiftUI

//struct SwitchesView: View {
//    let room: Room
//    @State private var isToggled = false
//    
//    var body: some View {
//        NavigationStack{
//            VStack(alignment: .leading) {
//                List(room.switches) { switchItem in
//                    HStack {
//                        Text(switchItem.name)
//                        Spacer()
//                        Image(systemName: switchItem.status == 1 ? "lightbulb.fill" : "lightbulb")
//                            .foregroundColor(switchItem.status == 1 ? .yellow : .gray)
//                        Spacer()
//                        Toggle("", isOn: $isToggled)
//                                    .padding()
////                                    .toggleStyle(SwitchToggleStyle())
//                        
//                    }
//                    .padding()
//                }
//            }
//        }
//        .navigationBarTitle("\(room.roomName) Switches")
//        .preferredColorScheme(.light)
//    }
//}
//
struct SwitchesView: View {
    let room: Room
    @State private var toggleStates: [Bool]
    
    init(room: Room) {
        self.room = room
        _toggleStates = State(initialValue: room.switches.map { $0.status == 1 })
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
               
                List {
                    ForEach(room.switches.indices, id: \.self) { index in
                        let switchItem = room.switches[index]
                        HStack {
                            Text(switchItem.name)
                            Spacer()
                            Image(systemName: switchItem.status == 1 ? "lightbulb.fill" : "lightbulb")
                                .foregroundColor(switchItem.status == 1 ? .yellow : .gray)
                            Spacer()
                            Toggle("", isOn: $toggleStates[index])
                                .padding()
                        }
                        .padding()
                    }
                    Button(action: toggleAllSwitches) {
                        HStack {
                            Text("Turn \(allSwitchesOff() ? "On" : "Off") All")
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: allSwitchesOff() ? "power" : "power")
                                .resizable()
                                .frame(width:30, height:30)
                                .foregroundColor(allSwitchesOff() ? .green : .red)
                                
                        }
                        .padding()
                        .padding(.trailing,20)
                        .background(Color.Primary)
                        .cornerRadius(8)
                    }
                }
            }
        }
        .navigationBarTitle("\(room.roomName) Switches")
        .preferredColorScheme(.light)
    }
    
    func toggleAllSwitches() {
        let allOff = allSwitchesOff()
        toggleStates = Array(repeating: allOff, count: toggleStates.count)
    }
    
    private func allSwitchesOff() -> Bool {
        return toggleStates.allSatisfy { !$0 }
    }
}

