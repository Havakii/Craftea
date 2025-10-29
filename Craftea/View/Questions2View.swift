//
//  Questions2View.swift
//  Craftea
//
//  Created by Apprenant 83 on 29/10/2025.
//

import SwiftUI
let options2 = [
    "Tous les jours (impossible de m’arrêter)",
    "Plusieurs fois par semaine",
    "De temps en temps, quand j’ai l’inspiration",
    "Rarement, mais j’aimerais m’y remettre",
    "Jamais… mais j’aimerais bien commencer !"
]

struct Questions2View: View {
    @State private var selectedOption: Int? = nil
    var body: some View {
        ZStack {
            LinearGradient(gradient:Gradient(colors: [Color(red: 224 / 255, green: 182 / 255, blue: 252 / 255), Color(red: 156 / 255, green: 123 / 255, blue: 245 / 255)]), startPoint: .topLeading, endPoint: .bottom)
            //Color("primaryPurpule")
            .ignoresSafeArea()
            VStack{
                Text("Trouve un loisir qui te correspond !")
                    .font(.custom("Manrope-Bold", size: 20))
                
                ProgressView(value: 0.142)                     .progressViewStyle(LinearProgressViewStyle(tint: Color("secondaryOrange")))
                    .frame(width: 300)

                
                Text("Quand tu penses loisir créatifi, tu penses plutôt à ...")
                    .font(.custom("Manrope-Bold", size: 17))
                    .padding()
                
                
                ForEach(0..<options2.count, id: \.self) { index in
                    HStack {
                        Text(options2[index])
                        Spacer()
                        Image(systemName: selectedOption == index ? "largecircle.fill.circle" : "circle")
                    }
                    .onTapGesture { selectedOption = index }
                    .foregroundColor(.black)
                    .frame(width: 400, height: 70)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(4)
                    
                }
                
                Button(action: {
                    print("Suivant")
                }) {
                    HStack{
                        NavigationLink(destination:QuestionsView()){
                            Text("Suivant")
                                .font(.custom("Manrope-Bold", size: 20))
                        }
                        Image(systemName: "arrow.right")
                            .fontWeight(.bold)
                        
                    } .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color("secondaryOrange"))
                        .cornerRadius(10)
                }
                
            }
                
            }
    }
        
    }

#Preview {
    Questions2View()
}
