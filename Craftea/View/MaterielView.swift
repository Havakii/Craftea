//
//  MaterielView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

struct MaterielView: View {
    @State private var searchText = ""
    @State private var condition: String = "Occasion"
    @State private var showingFilter = false
    @State private var navigateToAjout = false
    
    struct Materiel: Identifiable {
        let id = UUID()
        let nom: String
        let image: String
        let description: String
    }
    
    // Données pour Occasion
    let materielsOccasion: [Materiel] = [
        Materiel(nom: "Lot de pelotes de laine", image: "", description: "Je donne un lot de pelotes de laine."),
        Materiel(nom: "Cuir coloré", image: "", description: "Cherche personne qui donne du cuir de couleur."),
        Materiel(nom: "Tissu à motif", image: "", description: "Bonjour, je donne des tissus à motifs variés."),
        Materiel(nom: "Bobine de fil", image: "", description: "Je cherche quelqu’un à qui offrir mes bobines."),
        Materiel(nom: "Laine rose", image: "", description: "Je n’utilise plus cette laine, je la donne."),
        Materiel(nom: "Crochet 10mm", image: "", description: "Crochets inutilisés, parfaits pour débuter.")
    ]
    
    // Données pour Neuf
    let materielsNeuf: [Materiel] = [
        Materiel(nom: "Carnet de dessin", image: "", description: "Lot de carnets de dessin."),
        Materiel(nom: "Crayons", image: "", description: "Crayons de couleurs tons rouges."),
        Materiel(nom: "Palette d’aquarelle", image: "", description: "Palette parfaite pour débuter."),
        Materiel(nom: "Lot de pinceaux", image: "", description: "Différentes tailles pour vos créations.")
    ]
    
    var filteredMateriels: [Materiel] {
        let list = condition == "Occasion" ? materielsOccasion : materielsNeuf
        return searchText.isEmpty ? list :
        list.filter { $0.nom.localizedCaseInsensitiveContains(searchText) }
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                
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
                    
                    HStack {
                        Button(action: { showingFilter.toggle() }) {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .font(.title3)
                                .foregroundColor(.primaryPurpule)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .clipShape(Circle())
                        }
                        .sheet(isPresented: $showingFilter) {
                            VStack {
                                Text("Filtres disponibles")
                                    .font(.headline)
                                    .padding()
                                Button("Fermer") { showingFilter = false }
                                    .padding()
                            }
                            .presentationDetents([.fraction(0.3)])
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    SegmentedToggle(selection: $condition)
                        .padding(.top, 16)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(filteredMateriels) { materiel in
                                NavigationLink(destination: MaterielDetailView(materiel: materiel)) {
                                    VStack(spacing: 4) {
                                        Image(materiel.image.isEmpty ? "placeholder" : materiel.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            .padding(.top, 8)
                                        
                                        Spacer()
                                        
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
                                            .fill(Color.white)
                                            .shadow(radius: 2)
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.top, 12)
                        .padding(.bottom, condition == "Occasion" ? 120 : 20)
                    }
                }
                
                if condition == "Occasion" {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: { navigateToAjout = true }) {
                                Text("Publier un article")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(Color.primaryPurpule.opacity(0.6))
                                    .cornerRadius(12)
                            }
                            .frame(width: 160)
                        }
                        .padding()
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToAjout) {
                AjoutMaterielView()
            }
        }
    }
}

#Preview {
    MaterielView()
}

