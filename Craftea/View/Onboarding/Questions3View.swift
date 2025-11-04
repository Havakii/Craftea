//
//  Questions3View.swift
//  Craftea
//
//  Created by Apprenant 83 on 29/10/2025.
//

import SwiftUI

struct Questions3View: View {

    @State private var currentIndex = 0
    @State private var selectedOption: Int? = nil
    let questions: [Question] = [
        Question(
            text: "Comment tu choisis un nouveau loisir à tester ?",
            options: [
                "Au feeling, selon mes envies du moment",
                "En voyant des idées sur TikTok / Insta / Pinterest",
                "Parce qu’un(e) ami(e) m’en parle",
                "En fonction du matériel que j’ai déjà",
                "Selon le temps et le budget que j’ai"
            ],
            key: "motivation"
        )]
    var body: some View {
        let question = questions[currentIndex]
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 224/255, green: 182/255, blue: 252/255),
                        Color(red: 156/255, green: 123/255, blue: 245/255)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Trouve un loisir qui te correspond !")
                        .font(.custom("Manrope-Bold", size: 20))
                        .padding(.top, 40)
                    
                    ProgressView(value: 3.0 / 7.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color("secondaryOrange")))
                        .frame(width: 300)
                    
                    Text(question.text)
                        .font(.custom("Manrope-Bold", size: 17))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    ForEach(question.options.indices, id: \.self) { index in
                        HStack {
                            Text(question.options[index])
                                .font(.custom("Manrope-Regular", size: 15))
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.horizontal, 10)
                            Spacer()
                            Image(systemName: selectedOption == index ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(selectedOption == index ? Color("secondaryOrange") : .gray)
                                .padding(.trailing, 10)
                        }
                        .padding()
                        .frame(width: 350, height: 70)
                        .background(.white)
                        .cornerRadius(10)
                        .onTapGesture { selectedOption = index }
                    }
                    
                    NavigationLink(destination: Questions4View()) {
                        HStack {
                            Text("Suivant")
                                .font(.custom("Manrope-Bold", size: 20))
                            Image(systemName: "arrow.right")
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(selectedOption != nil ? Color("secondaryOrange") : .gray)
                        .cornerRadius(10)
                        .padding(.top, 20)
                    }
                    .disabled(selectedOption == nil)
                }
            }
        }
    }
}
#Preview {
    Questions3View()
}
