//
//  ContactForm.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 29/4/24.
//

import SwiftUI

struct ContactForm: View {
    @State private var isSheetPresented = true
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var message = ""
    
    var body: some View {
        VStack{
            Text("Have any more query?")
                .foregroundColor(.gray)
            Button(action: {
                isSheetPresented.toggle()
            }) {
                Text("Send Message").bold()
                    .foregroundColor(.white)
                    .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .frame(width:350, height: 40)
                    .foregroundColor(.Primary) // Set your desired background color here
            )
            .sheet(isPresented: $isSheetPresented, content: {
                ContactFormView(isSheetPresented: $isSheetPresented, name: $name, email: $email, phone: $phone, message: $message)
            })
        }
        .padding([.top, .bottom])
        .frame(maxWidth: .infinity)
//        .background(Color.Primary.opacity(0.3))
        .background(
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, topTrailing: 20))
                .fill(Color.Primary.opacity(0.1))
        )
    }
}

struct ContactFormView: View {
    @Binding var isSheetPresented: Bool
    @Binding var name: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var message: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isSheetPresented = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .font(.title)
                }
                .padding()
            }
            Text("Contact us").font(.title).bold()
            Text("How can we assist you").foregroundColor(.gray)
            Spacer()
            VStack(alignment: .leading){
                Text("Name").bold()
                TextField("Enter your name", text: $name)
                    .padding()
                    .frame(height: 40)
                    .border(Color.Primary, width: 2)
                    .cornerRadius(5)
                Text("Email").bold()
                TextField("Enter your email", text: $email)
                    .padding()
                    .frame(height: 40)
                    .border(Color.Primary, width: 2)
                    .cornerRadius(5)
                Text("Phone").bold()
                TextField("Enter your phone", text: $phone)
                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 40)
                    .border(Color.Primary, width: 2)
                    .cornerRadius(5)
                Text("Message").bold()
                TextEditor(text: $message)
                    .padding()
                    .frame(height: 100)
                    .border(Color.Primary, width: 2)
                    .cornerRadius(5)
                //                .padding()
            }
                Spacer()
            
            Button("Submit") {
                print("Name: \(name)")
                print("Email: \(email)")
                print("Phone: \(phone)")
                print("Message: \(message)")
                isSheetPresented = false
            }
//            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .frame(width:330, height: 40)
                    .foregroundColor(.Primary)
            )
            .foregroundColor(.white)
            .padding()
        }
        .padding()
        .background(Color.Bg.opacity(0.1))
    }
}



#Preview {
    ContactForm()
}
