//
//  NoteView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

struct NoteView: View {
    @State private var rating = 0
    @State private var text = ""
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            LinearGradient(
                gradient: Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack(spacing: 20) {
                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= rating ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.secondaryOrange)
                            .onTapGesture {
                                rating = index
                            }
                    }
                }
                
                Text(message(for: rating))
                    .font(.headline)
                    .foregroundColor(.primaryPurpule)
                Text("Un petit commentaire ?")
                TextEditor(text: $text)
                    .frame(width: 350, height: 200)
                                    .padding(8)
                                    .background(Color(.almostWhite))
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                    )
                                    .font(.body)
                ButtonComponent(text: "Envoyer", style: .filled, size: .small, action: {})
            }
            .animation(.easeInOut, value: rating)
        }
        
    }
    
    func message(for rating: Int) -> String {
        switch rating {
        case 1: return "Pas terrible"
        case 2: return "Bof, moyen"
        case 3: return "Correct"
        case 4: return "Très bien !"
        case 5: return "Excellent !"
        default: return "Appuie sur une étoile pour noter"
        }
    }
}


#Preview {
    NoteView()
}
