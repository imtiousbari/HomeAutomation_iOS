//
//  AddNewGrp.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 17/1/24.
//
//
import SwiftUI

struct AddNewCat: View {
    @State private var showingModal = false
    
    var body: some View {
        ZStack {
            VStack/*(spacing: 20)*/ {
                
                Button(action: {
                    self.showingModal = true
                }) {
                    Text("+ Add Group")
                                   .font(.system(size: 14))
                                   .foregroundColor(.black)
                                   .padding(10)
                                   .background(Color.white)
                                   .cornerRadius(10)
                }
//                Spacer()
            }
            
            // The Custom Popup is on top of the screen
            if $showingModal.wrappedValue {
                // But it will not show unless this variable is true
                ZStack {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.vertical)
                    // This VStack is the popup
                    VStack(spacing: 20) {
                        Text("Popup")
                            .bold().padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                        Spacer()
                        Button(action: {
                            self.showingModal = false
                        }) {
                            Text("Close")
                        }.padding()
                    }
                    .frame(width: 300, height: 200)
//                    .background(Color.white)
                    .cornerRadius(20).shadow(radius: 20)
                }
            }
        }
    }
}
//    @State private var isModalPresented = false
//
//    var body: some View {
//        Button(action: {
//            isModalPresented.toggle()
////            AddNewGrp()
//                
//        }) {
//            Text("+ Add Group")
//                .font(.system(size: 14))
//                .foregroundColor(.black)
//                .padding(10)
//                .background(Color.white)
//                .cornerRadius(10)
//        }
//        .sheet(isPresented: $isModalPresented) {
//            AddNewGrp()
//                .zIndex(1.0)
//        }
//    }
//}
//
//
//struct AddNewGrp: View {
//    @State private var input1: String = ""
//    @State private var input2: String = ""
//
//    var body: some View {
//        BottomSheetView(isOpen: .constant(false), maxHeight: 900) {
//            VStack{
//                VStack {
//                    Text("Add New Group")
//                        .padding(10)
//                        .foregroundColor(.black)
//                    VStack(alignment: .leading){
//                        TextField("Group name", text: $input1)
//                        Divider()
//                    }
//                    .padding(8)
//                    .foregroundColor(.black)
//                    VStack(alignment: .leading){
//                        TextField("Details", text: $input2)
//                        Divider()
//                    }
//                    .padding(8)
//                    .foregroundColor(.black)
//                }
//                .padding(10)
//                HStack{
//                    Spacer()
//                    Button("Cancel") {
//                        // Action to perform when Save button in the modal is tapped
//                        // You can handle the data entered in the inputs here
//                    }
//                    .font(.system(size: 14))
//                    .foregroundColor(Color.Primary)
//                    .padding(10)
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.Primary, lineWidth: 1)
//                    )
////                    Spacer()
//                    Button("Save") {
//                        // Action to perform when Save button in the modal is tapped
//                        // You can handle the data entered in the inputs here
//                    }
//                    .font(.system(size: 14))
//                    .foregroundColor(.white)
//                    .padding(10)
//                    .padding(.leading, 5)
//                    .padding(.trailing, 5)
//                    .background(Color.Primary)
//                    .cornerRadius(10)
//                }
//                .padding([.leading, .trailing, .bottom])
//            }
//            .padding(.bottom, 40)
//            .frame(height: 250)
//            .background(Color.white)
//        }
//        .edgesIgnoringSafeArea(.all)
//
//    }
//}
//struct AddNewCat: View {
//    
//    @State private var showModel = false
//    
//    var body: some View {
//        ZStack{
//            Button(action: { showModel = true }){
//                Text("+ Add Group")
//                                .font(.system(size: 14))
//                                .foregroundColor(.black)
//                                .padding(10)
//                                .background(Color.white)
//                                .cornerRadius(10)
//            }
//            
//            
//            ModelView(isShowing: $showModel)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .statusBar(hidden: true)
//    }
//}
//struct ModelView: View {
//    
//    @Binding var isShowing: Bool
//    @State private var curHeight: CGFloat = 400
//    
//    let minHeight: CGFloat = 400
//    let maxHeight: CGFloat = 700
//    
//    var body: some View {
//        ZStack(alignment: .bottom){
//        if isShowing{
//                Color.black
//                    .opacity(0.3)
//                    .ignoresSafeArea()
//                    .onTapGesture {
//                        isShowing = false
//                    }
//                mainView
//                    .transition(.move(edge: .bottom))
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//        .ignoresSafeArea()
//        .animation(.easeIn)
//    }
//    var mainView: some View{
//        VStack{
//            
//            ZStack{
//                Capsule()
//                    .frame(width: 40, height: 6)
//            }
//            .frame(height: 40)
//            .frame(maxWidth: .infinity)
//            .background(Color.white.opacity(0.00001))
//            .gesture(dragGesture)
//            
//            ZStack{
//                VStack{
//                    Text("\"Hi👋🏻 welcome to my video\"")
//                        .font(.system(size: 22, weight: .regular))
//                        .multilineTextAlignment(.center)
//                        .fixedSize(horizontal: false, vertical: true)
//                        .padding(.bottom, 10)
//                        
//                    
//                    Text("eyh.dev")
//                        .font(.system(size: 20, weight: .light))
//                }
//                .padding(.horizontal, 30)
//                }
//            .frame(maxHeight: .infinity)
//            .padding(.bottom, 35)
//        }
//        .frame(height: curHeight)
//        .frame(maxWidth: .infinity)
//        .background(
//            ZStack{
//                RoundedRectangle(cornerRadius: 30)
//                    Rectangle()
//                    .frame(height: curHeight / 2)
//            }
//            
//                .foregroundColor(.white))
//    }
//    
//    @State private var prevDragTranslation = CGSize.zero
//    var dragGesture: some Gesture{
//        
//        DragGesture(minimumDistance: 0, coordinateSpace: .global)
//            .onChanged { val in
//                let dragAmount = val.translation.height - prevDragTranslation.height
//                if curHeight > maxHeight || curHeight < minHeight {
//                    curHeight -= dragAmount / 6
//                }else{
//                    curHeight -= dragAmount
//                }
//                prevDragTranslation = val.translation
//            }
//            .onEnded { val in
//                prevDragTranslation = .zero
//       }
//    }
//}


//#Preview {
//    AddNewCat()
//}


