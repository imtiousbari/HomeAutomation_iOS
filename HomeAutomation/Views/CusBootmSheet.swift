//
//  CusBootmSheet.swift
//  CustomBottomSheet
//
//  Created by Imtious Bari on 20/1/24.
//

import SwiftUI

struct CusBootmSheet: View {
    
    @State var isShowingBottomSheet = false
    
    var body: some View {
        ZStack{
            
            Button{
                withAnimation{
                    isShowingBottomSheet.toggle()
                }
            } label: {
                Text("Open Bottom Sheet")
            }
            
            BottomSheet(isShowing: $isShowingBottomSheet)
        }
    }
}
struct BottomSheet: View {
    
    @Binding var isShowing: Bool
    @State private var input1: String = ""
    @State private var input2: String = ""
    
    var body: some View {
        ZStack(alignment: .center) {
            if (isShowing) {
                Color.gray.opacity(isShowing ? 0.8 : 0)
//                Color.clear
//                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                VStack{
                    VStack {
                        Text("Add New Group")
                            .padding(10)
                            .foregroundColor(.black)
                        VStack(alignment: .leading){
                            TextField("Group name", text: $input1)
                                .colorScheme(.light)
                                .foregroundColor(.black)
                            Divider()
                        }
                        .padding(8)
                        .foregroundColor(.black)
                        VStack(alignment: .leading){
                            TextField("Details", text: $input2)
                                .colorScheme(.light)
                                .foregroundColor(.black)
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
                            isShowing.toggle()
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
                            print("Saved")
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
                
                .frame(height: 250)
                .background(Color.white)
                .padding(.bottom, 20)
//                .transition(.move(edge: .top))
                .background(
                    Color(uiColor: .white)
                )
                .cornerRadius(16, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                .opacity(isShowing ? 1 : 0)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorners(radius: radius, corners: corners) )
    }
}

struct RoundedCorners: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    CusBootmSheet()
}
