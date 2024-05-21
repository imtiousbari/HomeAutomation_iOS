//
//  SmartSwitchView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 20/5/24.
//

import SwiftUI

struct SmartOfficeView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                
                Text("Office")
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.leading)
                    .padding(.top)
                    .foregroundColor(.black)
                ScrollView(.vertical, showsIndicators: true) {
                    NavigationLink(destination: SmartSwitchView()) {
                        Rectangle()
                            .frame(width: 170, height: 120)
                            .cornerRadius(15)
                            .overlay(
                                VStack {
                                    HStack {
                                        Image("4gangswth")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Spacer()
                                        Image(systemName: "power.circle")
                                            .font(.system(size: 20))
                                            .foregroundColor(.green)
                                    }
                                    .padding(15)
                                    Spacer()
                                    HStack {
                                        Text("Office")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                        Spacer()
                                        Text("On")
                                            .foregroundColor(.CusYellow)
                                            .font(.system(size: 14))
                                    }
                                    .padding()
                                }
                            )
                            .foregroundColor(.Primary)
                    }
                }
            }.padding()
            Spacer()
        }
        
    }
}

struct RoundedBellButtonStyle: ButtonStyle {
    let isBellPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: "bell.fill")
                .foregroundColor(isBellPressed ? .Primary : .gray)
                .padding(40)
                .font(.system(size: 30))
            configuration.label
                .padding()
            
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(isBellPressed ? Color.Primary : Color.gray, lineWidth: 10)
        )
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        .animation(.easeInOut(duration: 0.1))
        .padding()
    }
}

struct SmartSwitchView: View {
    @ObservedObject var viewModel = SwitchViewModel()
    
    @State private var lightOn = false
    @State private var fanOn = false
    @State private var bellPressed = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Image("BossRoom")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.top)
                VStack {
                    HStack {
                        // Light toggle
                        Rectangle()
                            .frame(width: 170, height: 120)
                            .cornerRadius(15)
                            .foregroundColor(lightOn ? .Primary : .white)
                        // UI code for Light toggle...y
                            .overlay(
                                VStack {
                                    VStack {
                                        HStack{
                                            Text("Light")
                                                .font(.system(size: 14))
                                                .foregroundColor(lightOn ? .white : .Primary)
                                            Spacer()
                                            Image(systemName: lightOn ? "lightbulb.fill" : "lightbulb")
                                                .foregroundColor(.gray)
                                        }
                                        .padding([.leading, .trailing])
                                        Spacer()
                                        HStack{
                                            Text(lightOn ? "On" : "Off")
                                                .font(.system(size: 14))
                                                .foregroundColor(lightOn ? .yellow : .red)
                                            Spacer()
                                            Toggle(isOn: $lightOn) {
                                            }
                                        }
                                        .padding([.leading, .trailing, .bottom])
                                        .onChange(of: lightOn) { _ in
                                            UserDefaults.standard.set(lightOn, forKey: "lightOn")
                                            fetchDataWithParameters()
                                        }
                                    }
                                    .foregroundColor(.white)
                                }
                                    .padding(.top)
                            )
                            .onChange(of: lightOn) { _ in
                                UserDefaults.standard.set(lightOn, forKey: "lightOn")
                                fetchDataWithParameters()
                            }
                        
                        // Fan toggle
                        Rectangle()
                            .frame(width: 170, height: 120)
                            .cornerRadius(15)
                            .foregroundColor(fanOn ?  .Primary : .white)
                        // UI code for Fan toggle...
                            .overlay(
                                VStack {
                                    VStack {
                                        HStack{
                                            Text("Fan")
                                                .font(.system(size: 14))
                                                .foregroundColor(fanOn ? .white : .Primary)
                                            Spacer()
                                            Image(systemName: "lightbulb")
                                                .foregroundColor(.gray)
                                        }
                                        .padding([.leading, .trailing])
                                        Spacer()
                                        HStack{
                                            Text(fanOn ? "On" : "Off")
                                                .font(.system(size: 14))
                                                .foregroundColor(fanOn ? .yellow : .red)
                                            Spacer()
                                            Toggle(isOn: $fanOn) {
                                            }
                                        }
                                        .padding([.leading, .trailing, .bottom])
                                        .onChange(of: fanOn) { _ in
                                            UserDefaults.standard.set(fanOn, forKey: "fanOn")
                                            fetchDataWithParameters()
                                        }
                                    }
                                    .foregroundColor(.white)
                                }
                                    .padding(.top)
                            )
                            .onChange(of: fanOn) { _ in
                                UserDefaults.standard.set(fanOn, forKey: "fanOn")
                                fetchDataWithParameters()
                            }
                    }
                    
                    // Bell button...
                    Button(action: {
                                            bellPressed.toggle()
                                            UserDefaults.standard.set(bellPressed, forKey: "bellPressed")
                                            fetchDataWithParameters()
                                            if bellPressed {
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                    bellPressed = false
                                                    UserDefaults.standard.set(bellPressed, forKey: "bellPressed")
                                                    fetchDataWithParameters()
                                                }
                                            }
                                        }) {
                                        }
                                        .buttonStyle(RoundedBellButtonStyle(isBellPressed: bellPressed))
                                        .padding()
                }
                .padding()
            }
            .onAppear {
                // Fetch initial data
                viewModel.fetchInitialData { response in
                    lightOn = response.light == 1
                    fanOn = response.fan == 1
                    bellPressed = response.bell == 1
                }
            }
            .background(Color.Bg)
        }
    }
    
    private func fetchDataWithParameters() {
        viewModel.fetchData(light: lightOn ? 1 : 0, fan: fanOn ? 1 : 0, bell: bellPressed ? 1 : 0)
    }
}





//struct SmartSwitchView: View {
//    @ObservedObject var viewModel = SwitchViewModel()
//
//    @AppStorage("lightOn") private var lightOn = false
//    @AppStorage("fanOn") private var fanOn = false
//    @AppStorage("bellPressed") private var bellPressed = false
//    var body: some View {
//        NavigationStack {
//            VStack(alignment: .leading) {
//                Image("BossRoom")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .edgesIgnoringSafeArea(.top)
//                VStack {
//                    HStack {
//                        Rectangle()
//                            .frame(width: 170, height: 120)
//                            .cornerRadius(15)
//                            .foregroundColor(lightOn ? .Primary : .white)
//                            .overlay(
//                                VStack {
//                                    VStack {
//                                        HStack{
//                                            Text("Light")
//                                                .font(.system(size: 14))
//                                                .foregroundColor(lightOn ? .white : .Primary)
//                                            Spacer()
//                                            Image(systemName: lightOn ? "lightbulb.fill" : "lightbulb")
//                                                .foregroundColor(.gray)
//                                        }
//                                        .padding([.leading, .trailing])
//                                        Spacer()
//                                        HStack{
//                                            Text(lightOn ? "On" : "Off")
//                                                .font(.system(size: 14))
//                                                .foregroundColor(lightOn ? .yellow : .red)
//                                            Spacer()
//                                            Toggle(isOn: $lightOn) {
//                                            }
//                                        }
//                                        .padding([.leading, .trailing, .bottom])
//                                        .onChange(of: lightOn) { _ in
//                                            UserDefaults.standard.set(lightOn, forKey: "lightOn")
//                                            fetchDataWithParameters()
//                                        }
//                                    }
//                                    .foregroundColor(.white)
//                                }
//                                .padding(.top)
//                            )
//                        Rectangle()
//                            .frame(width: 170, height: 120)
//                            .cornerRadius(15)
//                            .foregroundColor(fanOn ?  .Primary : .white)
//                            .overlay(
//                                VStack {
//                                    VStack {
//                                        HStack{
//                                            Text("Fan")
//                                                .font(.system(size: 14))
//                                                .foregroundColor(fanOn ? .white : .Primary)
//                                            Spacer()
//                                            Image(systemName: "lightbulb")
//                                                .foregroundColor(.gray)
//                                        }
//                                        .padding([.leading, .trailing])
//                                        Spacer()
//                                        HStack{
//                                            Text(fanOn ? "On" : "Off")
//                                                .font(.system(size: 14))
//                                                .foregroundColor(fanOn ? .yellow : .red)
//                                            Spacer()
//                                            Toggle(isOn: $fanOn) {
//                                            }
//                                        }
//                                        .padding([.leading, .trailing, .bottom])
//                                        .onChange(of: fanOn) { _ in
//                                            UserDefaults.standard.set(fanOn, forKey: "fanOn")
//                                            fetchDataWithParameters()
//                                        }
//                                    }
//                                    .foregroundColor(.white)
//                                }
//                                .padding(.top)
//                            )
//                    }
//                    Button(action: {
//                        bellPressed.toggle()
//                        UserDefaults.standard.set(bellPressed, forKey: "bellPressed")
//                        fetchDataWithParameters()
//                        if bellPressed {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                                bellPressed = false
//                                UserDefaults.standard.set(bellPressed, forKey: "bellPressed")
//                                fetchDataWithParameters()
//                            }
//                        }
//                    }) {
//                    }
//                    .buttonStyle(RoundedBellButtonStyle(isBellPressed: bellPressed))
//                    .padding()
//                }.padding()
//            }
//
//            .onAppear {
//                fetchDataWithParameters()
//            }
//            .background(Color.Bg)
//        }
//    }
//
//    private func fetchDataWithParameters() {
//        viewModel.fetchData(light: lightOn ? 1 : 0, fan: fanOn ? 1 : 0, bell: UserDefaults.standard.bool(forKey: "bellPressed") ? 1 : 0)
//    }
//}




struct SmartSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SmartOfficeView()
        //        SmartSwitchView()
    }
}
