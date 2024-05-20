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
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: "bell.fill")
                .foregroundColor(.blue)
            configuration.label
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
        }
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        .animation(.easeInOut(duration: 0.1))
    }
}

struct SmartSwitchView: View {
    @ObservedObject var viewModel = SwitchViewModel()
    @State private var lightOn = false
    @State private var fanOn = false
    @State private var bellPressed = false
    
    var body: some View {
        
        NavigationStack {
            
//                .foregroundColor(.white)
            VStack(alignment: .leading) {
                Image("BossRoom")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.top)
//                    .padding(.top, -90)
//                Spacer()
                VStack {
//                    Text("Switch Status")
//                        .font(.title)
//                        .padding()
                    
                    Toggle(isOn: $lightOn) {
                        Text("Light")
                    }
                    .padding()
                    .onChange(of: lightOn) { _ in
                        fetchDataWithParameters(light: lightOn ? 1 : 0, fan: fanOn ? 1 : 0, bell: 0)
                    }
                    
                    Toggle(isOn: $fanOn) {
                        Text("Fan")
                    }
                    .padding()
                    .onChange(of: fanOn) { _ in
                        fetchDataWithParameters(light: lightOn ? 1 : 0, fan: fanOn ? 1 : 0, bell: 0)
                    }
                    
                    Button(action: {
                        bellPressed.toggle()
                        fetchDataWithParameters(light: lightOn ? 1 : 0, fan: fanOn ? 1 : 0, bell: bellPressed ? 1 : 0)
                        if bellPressed {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                bellPressed = false
                                fetchDataWithParameters(light: lightOn ? 1 : 0, fan: fanOn ? 1 : 0, bell: 0)
                            }
                        }
                    }) {
                        Text("Bell \(bellPressed ? "Pressed" : "Released")")
                    }
                    .buttonStyle(RoundedBellButtonStyle())
                    .padding()
                }
                .padding(50)
                .onAppear {
                    fetchDataWithParameters(light: lightOn ? 1 : 0, fan: fanOn ? 1 : 0, bell: 0)
                }
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.Bg)
//            .padding(.bottom, 20)
        }
    }
    
    private func fetchDataWithParameters(light: Int, fan: Int, bell: Int) {
        viewModel.fetchData(light: light, fan: fan, bell: bell)
    }
}

struct SmartSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SmartOfficeView()
    }
}
