//
//  MaterielDetailView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

struct MaterielDetailView: View {
    let materiel: MaterielView.Materiel
    let typeMateriel: String = "Don"
    @Environment(\.dismiss) private var dismiss
    @State private var isLiked = false
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Image(materiel.image.isEmpty ? "placeholder" : materiel.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 4)
                    
                    HStack(alignment: .center, spacing: 8) {
                        Text(materiel.nom)
                            .secondaryTitle()
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 7)
                        
                        Spacer()
                        
                        Text(materiel.typeMateriel ?? materiel.prix ?? "Don")
                            .categoryText()
                            .foregroundColor(.primaryPurpule)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .background(                                ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.ultraThinMaterial)
                                    .fill(Color.white.opacity(0.9))
                                    .stroke(Color.white.opacity(0.25), lineWidth: 0.5)
                            }
                            )
                            .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 1)
                    }
                    .padding(.horizontal, 7)
                    
                    if let pseudo = materiel.vendeurPseudo,
                       let note = materiel.vendeurNote,
                       let image = materiel.vendeurImage,
                       let localisation = materiel.localisation {
                        
                        HStack(alignment: .center, spacing: 12) {
                            Image(image.isEmpty ? "placeholder" : image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.primaryPurpule.opacity(0.5), lineWidth: 2)
                                )
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(pseudo)
                                    .mainText(bold: true)
                                
                                Text(String(format: "%.1f ★", note))
                                    .secondaryText()
                                    .bold()
                                    .foregroundColor(.orange.opacity(0.7))
                                    .padding(.horizontal, 9)
                                    .padding(.vertical, 2)
                                    .background(
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 6)
                                                .fill(.ultraThinMaterial)
                                                .fill(Color.yellow.opacity(0.6))
                                                .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                                        }
                                    )
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Text("Contacter")
                                    .buttonLabel()
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 18)
                                    .padding(.vertical, 10)
                                    .background(
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(.ultraThinMaterial)
                                                .fill(Color.primaryPurpule.opacity(0.6))
                                                .stroke(Color.white.opacity(0.25), lineWidth: 0.5)
                                        }
                                    )
                                    .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal, 7)
                        .padding(.top, -8)
                        
                        HStack(spacing: 6) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.primaryPurpule)
                            Text(localisation)
                                .secondaryText()
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 7)
                        
                    } else if let texte = materiel.vendeurTexte {
                        Text(texte)
                            .mainText()
                            .foregroundColor(.gray)
                            .padding(.horizontal, 7)
                    }
                    
                    Text(materiel.description)
                        .mainText()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(4)
                        .padding(.horizontal, 7)
                    
                    Spacer(minLength: 80)
                }
                .padding()
            }
            
            if materiel.vendeurTexte != nil {
                Button(action: {}) {
                    HStack {
                        Text("Aller sur le site du vendeur")
                            .buttonLabel()
                            .foregroundColor(.white)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .padding()
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.ultraThinMaterial)
                                .fill(Color.primaryPurpule.opacity(0.8))
                                .stroke(Color.white.opacity(0.25), lineWidth: 0.5)
                        }
                    )
                    .padding(.horizontal)
                    .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 2)
                    .padding(.bottom, 8)
                }
            }
        }
        .background(Color.background)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primaryPurpule)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { isLiked.toggle() }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(.primaryPurpule)
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
                description: "Je donne un lot de pelotes de laine, parfait pour le tricot ou le crochet. Couleurs variées, bon état.",
                vendeurPseudo: "Bastien42",
                vendeurImage: "",
                vendeurNote: 4.8,
                localisation: "Lyon",
                vendeurTexte: nil,
                prix: nil,
                typeMateriel: "Don"
            )
        )
    }
}

