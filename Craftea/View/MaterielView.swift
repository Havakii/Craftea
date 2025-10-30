//
//  MaterielView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

struct MaterielView: View {
    @State private var searchText = ""
    var searchTextfromDetailView: String = ""
    @State private var condition: String = "Occasion"
    @State private var showingFilter = true
    @State private var showAjoutMateriel = false
    @State private var selectedFilters: [String] = []
    
    struct Materiel: Identifiable {
        let id = UUID()
        let nom: String
        let image: String
        let description: String
        
        let vendeurPseudo: String?
        let vendeurImage: String?
        let vendeurNote: Double?
        let localisation: String?
        let vendeurTexte: String?
        let prix: String?
        let typeMateriel: String?
    }
    
    // Données Occasion
    let materielsOccasion: [Materiel] = [
        Materiel(nom: "Lot de pelotes de laine", image: "laine.Img", description: "Je donne ce lot de pelotes de laine, parfait pour tricoter ou crocheter tout ce que vous voulez.", vendeurPseudo: "Bastien42", vendeurImage: "", vendeurNote: 4.8, localisation: "Lyon", vendeurTexte: nil, prix: nil, typeMateriel: "Don"),
        Materiel(nom: "Cuir coloré", image: "cuir.Img", description: "J'échange des morceaux de cuir coloré, parfaits pour customiser vos sacs ou accessoires.", vendeurPseudo: "Marie90", vendeurImage: "", vendeurNote: 4.2, localisation: "Lille", vendeurTexte: nil, prix: nil, typeMateriel: "Échange"),
        Materiel(nom: "Tissu à motif", image: "tissu.Img", description: "J’ai ces tissus à motifs à donner, idéal pour la couture ou encore des projets déco.", vendeurPseudo: "Leti_To", vendeurImage: "", vendeurNote: 4.9, localisation: "Tulle", vendeurTexte: nil, prix: nil, typeMateriel: "Don"),
        Materiel(nom: "Bobine de fil", image: "bobines.Img", description: "Je donne une bobine de fil, pratique pour tous vos travaux de couture ou projets DIY.", vendeurPseudo: "Thomas2132", vendeurImage: "", vendeurNote: 4.0, localisation: "Paris", vendeurTexte: nil, prix: nil, typeMateriel: "Don"),
        Materiel(nom: "Laine rose", image: "laineRose.Img", description: "J'échange cette pelote de laine rose toute douce, parfaite pour vos tricots ou crochets colorés.", vendeurPseudo: "Nath_Del", vendeurImage: "", vendeurNote: 4.5, localisation: "Toulouse", vendeurTexte: nil, prix: nil, typeMateriel: "Échange"),
        Materiel(nom: "Crochet 10mm", image: "crochet.Img", description: "Je donne ce crochet 10 mm, idéal pour tricoter ou crocheter des pièces épaisses facilement.", vendeurPseudo: "Jules", vendeurImage: "", vendeurNote: 4.3, localisation: "Marseille", vendeurTexte: nil, prix: nil, typeMateriel: "Don")
    ]
    
    // Données Neuf
    let materielsNeuf: [Materiel] = [
        Materiel(nom: "Carnet de dessin", image: "carnet.Img", description: "Carnet de dessin de qualité supérieure avec papier épais parfait pour les croquis.", vendeurPseudo: nil, vendeurImage: nil, vendeurNote: nil, localisation: nil, vendeurTexte: "Vendu par Emmaüs", prix: "3,50 €", typeMateriel: nil),
        Materiel(nom: "Crayons", image: "crayons.Img", description: "Pack complet de crayons offrant une large gamme de duretés pour toutes vos créations.", vendeurPseudo: nil, vendeurImage: nil, vendeurNote: nil, localisation: nil, vendeurTexte: "Vendu par Mosaïk", prix: "3,00 €", typeMateriel: nil),
        Materiel(nom: "Palette d’aquarelle", image: "aquarelle.Img", description: "Palette compacte et pratique, avec des pigments riches et intenses.", vendeurPseudo: nil, vendeurImage: nil, vendeurNote: nil, localisation: nil, vendeurTexte: "Vendu par Geev Shop", prix: "4,00 €", typeMateriel: nil),
        Materiel(nom: "Lot de pinceaux", image: "pinceaux.Img", description: "Lot de pinceaux polyvalent pour toutes vos techniques de peinture.", vendeurPseudo: nil, vendeurImage: nil, vendeurNote: nil, localisation: nil, vendeurTexte: "Vendu par Emmaüs AGIR", prix: "2,00 €", typeMateriel: nil)
    ]
    
    var filteredMateriels: [Materiel] {
        let list = condition == "Occasion" ? materielsOccasion : materielsNeuf
        var filtered = searchText.isEmpty ? list :
        list.filter { $0.nom.localizedCaseInsensitiveContains(searchText) }
        
        if condition == "Occasion", !selectedFilters.isEmpty {
            filtered = filtered.filter { materiel in
                if let type = materiel.typeMateriel {
                    return selectedFilters.contains(type)
                }
                return false
            }
        }
        return filtered
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background").ignoresSafeArea()
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]),
                    startPoint: .topLeading,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    GlassEffectContainer() {
                        HStack(spacing: 8) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundStyle(Color.textSecondary)
                            TextField("Rechercher un matériel", text: $searchText)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .foregroundStyle(Color.textPrimary)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 12)
                    }
                    .glassEffect()
                    .padding(.top, 16)
                    .padding(.horizontal)
                    
                    if condition == "Occasion" {
                        GlassEffectContainer(spacing: 12.0) {
                            HStack {
                                Button(action: {
                                    withAnimation {
                                        showingFilter.toggle()
                                    }
                                }) {
                                    Image(systemName: "slider.vertical.3")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(Color.primaryPurpule)
                                }
                                .buttonStyle(.glass)
                                .zIndex(10)
                                .padding(.leading, 24)
                                
                                if showingFilter {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 12) {
                                            ForEach(["Don", "Prêt", "Échange"], id: \.self) { type in
                                                Button {
                                                    withAnimation {
                                                        if selectedFilters.contains(type) {
                                                            selectedFilters.removeAll { $0 == type }
                                                        } else {
                                                            selectedFilters.append(type)
                                                        }
                                                    }
                                                } label: {
                                                    Text(type)
                                                        .buttonLabel()
                                                        .padding(.vertical, 8)
                                                        .padding(.horizontal, 12)
                                                        .glassEffect(selectedFilters.contains(type) ?
                                                            .regular.tint(.primaryPurpule.opacity(0.6)).interactive() :
                                                                .regular.interactive())
                                                        .foregroundStyle(selectedFilters.contains(type) ? .white : .textPrimary)
                                                }
                                            }
                                        }
                                        .padding(.trailing, 24)
                                    }
                                }
                                Spacer()
                            }
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 16)
                    }
                    
                    SegmentedToggle(selection: $condition)
                        .padding(.top, 4)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(filteredMateriels) { materiel in
                                NavigationLink(destination: MaterielDetailView(materiel: materiel)) {
                                    VStack(alignment: .leading, spacing: 15) {
                                        ZStack(alignment: .topTrailing) {
                                            Image(materiel.image.isEmpty ? "placeholder" : materiel.image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 120)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                                .padding(.horizontal, 8)
                                                .padding(.top, 8)
                                            
                                            if condition == "Occasion", let type = materiel.typeMateriel {
                                                Text(type)
                                                    .font(.caption)
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.white)
                                                    .padding(.horizontal, 10)
                                                    .padding(.vertical, 6)
                                                    .background(
                                                        Capsule()
                                                            .fill(Color.primaryPurpule.opacity(0.7))
                                                    )
                                                    .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                                                    .offset(x: 20, y: 9)
                                            }
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(materiel.nom)
                                                .tertiaryTitle()
                                                .lineLimit(1)
                                                .padding(.horizontal, 8)
                                            
                                            Text(materiel.description)
                                                .secondaryText()
                                                .foregroundColor(.gray)
                                                .lineLimit(1)
                                                .padding(.horizontal, 8)
                                                .padding(.bottom, 8)
                                        }
                                    }
                                    .frame(height: 200)
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
                            Button(action: { showAjoutMateriel = true }) {
                                HStack(spacing: 6) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text("Publier un article")
                                        .buttonLabel()
                                        .foregroundColor(.white)
                                        .lineLimit(1)
                                        .fixedSize()
                                }
                                .padding(.vertical, 10)
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
            .navigationDestination(isPresented: $showAjoutMateriel) {
                AjoutMaterielView()
            }
            .onAppear {
                if !searchTextfromDetailView.isEmpty {
                    searchText = searchTextfromDetailView
                }
            }
        }
    }
}

#Preview {
    MaterielView()
}

