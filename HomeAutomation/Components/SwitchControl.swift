////
////  SwitchControl.swift
////  HomeAutomation
////
////  Created by Imtious Bari on 21/5/24.
////
//
//import SwiftUI
//
//struct SwitchControl: View {
//    
//        let title: String
//        @Binding var isOn: Bool
//        let action: () -> Void
//
//        var body: some View {
//            VStack {
//                Rectangle()
//                    .frame(width: 170, height: 120)
//                    .cornerRadius(15)
//                    .foregroundColor(.white)
//                    .overlay(
//                        VStack {
//                            VStack {
//                                HStack{
//                                    Text(title)
//                                        .font(.system(size: 14))
//                                        .foregroundColor(.Primary)
//                                    Spacer()
//                                    Image(systemName: "lightbulb")
//                                        .foregroundColor(.gray)
//                                }
//                                .padding([.leading, .trailing])
//                                Spacer()
//                                HStack{
//                                    Text(isOn ? "On" : "Off")
//                                        .font(.system(size: 14))
//                                        .foregroundColor(isOn ? .green : .red)
//                                    Spacer()
//                                    Toggle(isOn: $isOn, label: {})
//                                }
//                                .padding([.leading, .trailing, .bottom])
//                            }
//                            .foregroundColor(.white)
//                        }
//                        .padding(.top)
//                    )
//            }
//        }
//    }
//
//
//
////#Preview {
////    SwitchControl()
////}
