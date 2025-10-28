//
//  MaterielNeufVue.swift
//  Craftea
//
//  Created by Apprenant 80 on 28/10/2025.
//

import SwiftUI

struct MaterielNeufVue: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @State private var condition: String = "Neuf"
    
    struct Materiel: Identifiable {
        let id = UUID()
        let nom: String
        let image: String
        let description: String
    }
    
    let materiels: [Materiel] = [
        Materiel(nom: "Carnet de dessin", image: "", description: "Lot de carnets de dessin."),
        Materiel(nom: "Crayons", image: "", description: "Plusieurs crayons de couleurs dans les tons de rouge."),
        Materiel(nom: "Palette d'aquarelle", image: "", description: "Palette d'aquarelle parfaite pour débuter."),
        Materiel(nom: "Lot de pinceaux", image: "", description: "Lots de pinceaux de tailles différentes.")
    ]
    
    var filteredMateriels: [Materiel] {
        if searchText.isEmpty {
            return materiels
        } else {
            return materiels.filter { $0.nom.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Rechercher un matériel", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.top)
            
            HStack(spacing: 0) {
                Button(action: {
                    dismiss()
                }) {
                    Text("Occasion")
                        .foregroundColor(condition == "Occasion" ? .black : .gray)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(condition == "Occasion" ? Color.white : Color.clear)
                }

                Button(action: {
                    condition = "Neuf"
                }) {
                    Text("Neuf")
                        .foregroundColor(condition == "Neuf" ? .black : .gray)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(condition == "Neuf" ? Color.white : Color.clear)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemGray5))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            .padding(.horizontal)
            .padding(.top, 16)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(filteredMateriels) { materiel in
                        VStack (spacing: 2) {
                            Image(materiel.image.isEmpty ? "placeholder" : materiel.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .padding(.top, 8)
                            
                            Text(materiel.nom)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .padding(.horizontal, 8)
                            
                            Text(materiel.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .padding(.horizontal, 8)
                                .padding(.bottom, 8)
                        }
                        .frame(height: 180)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.systemGray6))
                                .shadow(radius: 2)
                        )
                        .padding(4)
                    }
                }
                .padding()
            }
        }
        .background(Color("beigeFond"))
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    NavigationStack {
        MaterielNeufVue()
    }
}


