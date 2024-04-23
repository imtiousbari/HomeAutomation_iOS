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
            
                List(viewModel.faqItems, id: \.id) { faq in
                    FAQRowView(faq: faq)
                }
        }
        .navigationBarTitle("FAQ & Feedback")
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
                    Spacer()
//                    Image(systemName: <#T##String#>)
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
