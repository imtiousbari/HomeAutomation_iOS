//
//  AddNewCat.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 13/1/24.
//

import SwiftUI

//struct AddNewCat: View {
//    @State private var isModalPresented = false
//
//    var body: some View {
//        Button(action: {
//            isModalPresented.toggle()
//            AddNewGrp()
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
//               
//        }
//    }
//}

struct ModalView: View {
    @State private var input1: String = ""
    @State private var input2: String = ""

    var body: some View {
        VStack{
            VStack {
                Text("Add New Group")
                    .padding(10)
                VStack(alignment: .leading){
                    TextField("Group name", text: $input1)
                }
                .padding(10)
                VStack(alignment: .leading){
                    TextField("Details", text: $input2)
                }
                .padding(10)
            }
            .padding(10)
            HStack{
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
        }
        .padding()
//        .frame(width: 2000, height: 10)
        .background(Color.white)
    }
        
}


#Preview {
    AddNewCat()
}
