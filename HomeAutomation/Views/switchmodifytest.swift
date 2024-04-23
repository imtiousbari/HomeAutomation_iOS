//
//  FaqView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 23/4/24.
//


import SwiftUI

struct SwitchsData: Codable {
    var switchesz: [Switchs]
}

struct Switchs: Codable, Identifiable {
    let id: Int  // Change the type of id to UUID
    let name: String
    var status: Int
}

class SwitchsManager: ObservableObject {
    static let shared = SwitchsManager()
    
    @Published private(set) var switchData: SwitchsData
    
    init() {
        self.switchData = SwitchsData(switchesz: []) // Initialize with an empty array
        loadData()
    }
    
    func toggleSwitch(withId id: Int) {
        if let index = switchData.switchesz.firstIndex(where: { $0.id == id }) {
            switchData.switchesz[index].status = switchData.switchesz[index].status == 0 ? 1 : 0
            saveData()
        }
    }

 
    func loadData() {
        if let file = Bundle.main.url(forResource: "Tswitch", withExtension: "json") {
            print("Found file: \(file)") // Debug print to ensure file existence
            do {
                let data = try Data(contentsOf: file)
                let decoder = JSONDecoder()
                switchData = try decoder.decode(SwitchsData.self, from: data)
            } catch {
                print("Error loading JSON: \(error.localizedDescription)")
            }
        } else {
            print("File not found")
        }
    }


    func saveData() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(switchData)
            if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Tswitch.json") {
                try data.write(to: fileURL)
                print("Data saved successfully to: \(fileURL)")
            } else {
                print("File URL is nil")
            }
        } catch {
            print("Error saving JSON: \(error.localizedDescription)")
        }
    }


}

struct TestSW: View {
    @ObservedObject private var switchsManager = SwitchsManager.shared

    var body: some View {
        VStack {
            if !switchsManager.switchData.switchesz.isEmpty {
                List(switchsManager.switchData.switchesz) { aSwitch in
                    SwitchRow(switchData: aSwitch, switchsManager: switchsManager)
                }
            } else {
                Text("Loading...")
                    .onAppear {
                        switchsManager.loadData()
                    }
            }
        }
    }
}
struct SwitchRow: View {
    @State private var isOn: Bool
    var switchData: Switchs
    var switchsManager: SwitchsManager

    init(switchData: Switchs, switchsManager: SwitchsManager) {
        self.switchData = switchData
        _isOn = State(initialValue: switchData.status == 1)
        self.switchsManager = switchsManager
    }

    var body: some View {
        HStack {
            Text(switchData.name)
            Spacer()
            Toggle(isOn: $isOn) {
                Text("")
            }
            .labelsHidden()
            .toggleStyle(SwitchToggleStyle(tint: isOn ? .green : .red))
            .onTapGesture {
                isOn.toggle()
                switchsManager.toggleSwitch(withId: switchData.id)
            }
        }
    }
}




#Preview{
    TestSW()
}
