//
//  ModalAddGroup.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 18/1/24.
//

import SwiftUI

struct ModalAddGroup: View {
        
    @Binding var isShowing: Bool
    @State private var curHeight: CGFloat = 300
    @State private var input1: String = ""
        @State private var input2: String = ""
    
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 500
    
    var body: some View {
        ZStack(alignment: .top){
            if isShowing{
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                mainView
                    .transition(.move(edge: .bottom))
//                    .onTapGesture {
//                        isShowing = false
//                    }
            }
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeIn)
    }
    var mainView: some View{
        VStack{
            
            ZStack{
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.00001))
            .gesture(dragGesture)
            
            ZStack{

                VStack{
                    VStack {
                        Text("Add New Group")
                            .padding(10)
                            .foregroundColor(.black)
                        VStack(alignment: .leading){
                            TextField("Group name", text: $input1)
                            Divider()
                        }
                        .padding(8)
                        .foregroundColor(.black)
                        VStack(alignment: .leading){
                            TextField("Details", text: $input2)
                            Divider()
                        }
                        .padding(8)
                        .foregroundColor(.black)
                    }
                    .padding(10)
                    HStack{
                        Spacer()
                        Button("Cancel") {
                            // Action to perform when Save button in the modal is tapped
                            // You can handle the data entered in the inputs here
                        }
                        .font(.system(size: 14))
                        .foregroundColor(Color.Primary)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.Primary, lineWidth: 1)
                        )
    //                    Spacer()
                        Button("Save") {
                            // Action to perform when Save button in the modal is tapped
                            // You can handle the data entered in the inputs here
                        }
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(10)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .background(Color.Primary)
                        .cornerRadius(10)
                    }
                    .padding([.leading, .trailing, .bottom])
                }
                .padding(.bottom, 40)
                .frame(height: 250)
                .background(Color.white)
                //
            }
            .frame(maxHeight: .infinity)
            .padding(.bottom, -35)
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: curHeight / 2)
            }
            
                .foregroundColor(.white))
    }
    
    @State private var prevDragTranslation = CGSize.zero
    var dragGesture: some Gesture{
        
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeight || curHeight < minHeight {
                    curHeight -= dragAmount / 6
                }else{
                    curHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = .zero
            }
    }

}

//#Preview {
//    ModalAddGroup(isShowing: $isModalPresented)
//}


//struct ModelView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
