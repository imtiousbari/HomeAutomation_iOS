//
//  SwitchesView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/4/24.
//

import SwiftUI

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
                Image("roomcover")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.top)
                    .foregroundColor(.white)
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 20)], spacing: 0) {
                    ForEach(room.switches.indices, id: \.self) { index in
                        Rectangle()
                            .frame(width: 170, height: 120)
                            .cornerRadius(15)
                            .foregroundColor(room.switches[index].status == 1 ? .Primary : .white) // Set foreground color
                            .overlay(
                                VStack {
                                    let switchItem = room.switches[index]
                                    VStack {
                                        HStack{
                                            Text(switchItem.name)
                                                .font(.system(size: 14))
                                                .foregroundColor(switchItem.status == 1 ? .white : .Primary)
                                            Spacer()
                                            Image(systemName: switchItem.status == 1 ? "lightbulb.fill" : "lightbulb")
                                                .foregroundColor(switchItem.status == 1 ? .yellow : .gray)
//                                            Spacer()
                                        }
                                        .padding([.leading, .trailing])
                                        Spacer()
                                        HStack{
                                            Text(allSwitchesOff() ? "On" : "Off")
                                                .font(.system(size: 14))
                                                .foregroundColor(switchItem.status == 1 ? .yellow : .red)
                                            Spacer()
                                            Toggle("", isOn: $toggleStates[index])
                                        }
                                        .padding([.leading, .trailing])
                                    }
                                    .padding([.top, .bottom])
                                    .foregroundColor(switchItem.status == 1 ? .Primary : .white)
                                }
                            )
                    }
                    .padding(8)
                   
                }
                .padding(8)
                
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
//                .padding()
                .padding([.leading, .trailing, .bottom])
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.Bg)
            .padding(.bottom, 20)
            
        }
        
        .navigationBarTitle("\(room.roomName) Switches")
//        .toolbarBackground(Color.white, for: .navigationBar)
        

        .preferredColorScheme(.light)
        
    }
   

    
    func toggleAllSwitches() {
        let allOff = allSwitchesOff()
        toggleStates = Array(repeating: allOff, count: toggleStates.count)
        let toggleStatus = toggleStates.map { $0 ? 1 : 0 }
        print("Toggle States: \(toggleStatus)")

        for (index, switchState) in toggleStates.enumerated() {
            let switchName = room.switches[index].name
            let switchStatus = switchState ? "On" : "Off"
            print("Switch \(switchName) is \(switchStatus)")
        }
    }
    
    private func allSwitchesOff() -> Bool {
        return toggleStates.allSatisfy { !$0 }
    }
}

