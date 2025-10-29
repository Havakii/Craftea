//
//  MaterielDetailView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

struct MaterielDetailView: View {
    let materiel: MaterielView.Materiel
    @Environment(\.dismiss) private var dismiss
    @State private var isLiked = false

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                Image(materiel.image.isEmpty ? "placeholder" : materiel.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 4)

                Text(materiel.nom)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)

                Text(materiel.description)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primaryPurpule)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isLiked.toggle()
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .primaryPurpule : .primaryPurpule)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MaterielDetailView(
            materiel: MaterielView.Materiel(
                nom: "Lot de pelotes de laine",
                image: "",
                description: "Je donne un lot de pelotes de laine, parfait pour le tricot ou le crochet. Couleurs variées, bon état."
            )
        )
    }
}
