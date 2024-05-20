//
//  FaqView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 22/4/24.
//


import SwiftUI

struct FAQItem: Codable, Identifiable {
    let id: Int
    let question: String
    let answer: String
}



class FAQViewModel: ObservableObject {
    @Published var faqItems: [FAQItem] = []
    
    init() {
        loadFAQ()
    }
    
    func loadFAQ() {
        if let url = Bundle.main.url(forResource: "faq", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode([String: [FAQItem]].self, from: data)
                if let faqItems = decodedData["FAQ"] {
                    self.faqItems = faqItems
                }
            } catch {
                print("Error decoding FAQ JSON: \(error)")
            }
        } else {
            print("File not found")
        }
    }
    
    
}
struct FAQView: View {
    @ObservedObject var viewModel = FAQViewModel()
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView{
                    VStack(alignment: .leading){
                        
                        Text("Frequently asked \nquestions")
                            .font(.title)
                            .fontWeight(.heavy)
                        ForEach(viewModel.faqItems, id: \.id) { faq in
                            FAQRowView(faq: faq)
                        }
                    }
                    .padding()
                }
                Spacer()
                ContactForm()
//                    .padding(.bottom,10)
            }
//            Spacer()
        }
//        .navigationBarTitle("FAQ & Feedback")
        .navigationSplitViewColumnWidth(20)
        .preferredColorScheme(.light)
        .edgesIgnoringSafeArea(.all)
    }
}

struct FAQRowView: View {
    @State private var isExpanded: Bool = false
    let faq: FAQItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
            }) {
                HStack{
                    Text(faq.question)
                        .font(.headline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName:"chevron.forward")
                        .foregroundColor(.gray)
                        .rotationEffect(Angle(degrees: isExpanded ? 90 : 0))
                }
            }
            .padding([.top, .bottom])
            if isExpanded {
                Text(faq.answer)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .padding([.top, .bottom])
            }
         }
    }
}


#Preview {
    FAQView()
    
}
