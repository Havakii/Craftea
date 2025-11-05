//
//  Questions5View.swift
//  Craftea
//
//  Created by Apprenant 83 on 29/10/2025.
//

import SwiftUI

struct Questions5View: View {
    // States
    @State private var currentIndex = 0
    @State private var selectedOption: Int? = nil
    
    // Question data
    let questions: [Question] = [
        Question(
            text: "Dans quelle(s) grande(s) catégorie(s) de loisirs tu te reconnais le plus ?",
            options: [
                "Arts visuels (peinture, dessin, photo…)",
                "Arts textiles (couture, tricot, crochet…)",
                "DIY & bricolage (déco, bois, récup’…)",
                "Écriture & narration (journaling, scrapbooking, histoires…)",
                "Autre (je sors des cases)"
            ],
            key: "category2"
        )]
    
    // Body
    var body: some View {
        let question = questions[currentIndex]
        
        NavigationStack {
            ZStack {
                // Fond en dégradé violet
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
                    // Titre principal
                    Text("Trouve un loisir qui te correspond !")
                        .font(.custom("Manrope-Bold", size: 20))
                        .padding(.top, 40)
                    
                    // Barre de progression
                    ProgressView(value: 5.0 / 7.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color("secondaryOrange")))
                        .frame(width: 300)
                    
                    // Question
                    Text(question.text)
                        .font(.custom("Manrope-Bold", size: 17))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    // Options
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
                    
                    // Bouton Suivant
                    NavigationLink(destination: Questions6View()) {
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
    Questions5View()
}
