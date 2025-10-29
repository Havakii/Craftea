//
//  Questions4View.swift
//  Craftea
//
//  Created by Apprenant 83 on 29/10/2025.
//

import SwiftUI
let options4 = [
    "Au feeling, selon mes envies du moment",
    "En voyant des idées sur TikTok / Insta / Pinterest",
    "Parce qu’un(e) ami(e) m’en parle",
    "En fonction du matériel que j’ai déjà",
    "Selon le temps et le budget que j’ai"
]

struct Questions4View: View {
    @State private var selectedOption: Int? = nil
    var body: some View {
        ZStack {
            Color("primaryPurpule")
            .ignoresSafeArea()
            VStack{
                Text("Trouve un loisir qui te correspond !")
                    .font(.custom("Manrope-Bold", size: 20))
                
                ProgressView(value: 0.142)                     .progressViewStyle(LinearProgressViewStyle(tint: Color("secondaryOrange")))
                    .frame(width: 300)

                
                Text("Quand il s’agit de matériel, tu es plutôt…")
                    .font(.custom("Manrope-Bold", size: 17))
                    .padding()
                
                
                ForEach(0..<options4.count, id: \.self) { index in
                    HStack {
                        Text(options4[index])
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
    Questions4View()
}
