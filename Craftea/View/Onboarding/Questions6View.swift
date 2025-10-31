//
//  Questions6View.swift
//  Craftea
//
//  Created by Apprenant 83 on 29/10/2025.
//

import SwiftUI

struct Questions6View: View {
    @Environment(User.self) private var user
    @State private var currentIndex = 0
    @State private var selectedOption: Int? = nil
    let questions: [Question] = [
        Question(
            text: "Quand tu pratiques un loisir créatif, c’est surtout pour…",
            options: [
                "Me détendre et vider ma tête",
                "Exprimer ma créativité",
                "Apprendre de nouvelles techniques",
                "Créer des choses utiles ou à offrir",
                "Passer un bon moment avec d’autres"
            ],
            key: "motivation2"
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
                    
                    ProgressView(value: 6.0 / 7.0)
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
                    
                    NavigationLink(destination: Questions7View()) {
                        HStack {
                            Text("Suivant")
                                .font(.custom("Manrope-Bold", size: 20))
                            Image(systemName: "arrow.right")
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color("secondaryOrange"))
                        .cornerRadius(10)
                        .padding(.top, 20)
                    }
                }
            }
        }
    }
}
#Preview {
    Questions6View().environment(users[0])
}
