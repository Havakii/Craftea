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
    @State private var showAjoutMateriel = false
    
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
    
    // Données pour Occasion
    let materielsOccasion: [Materiel] = [
        Materiel(nom: "Lot de pelotes de laine", image: "laine.Img", description: "Je donne ce lot de pelotes de laine, parfait pour tricoter ou crocheter tout ce que vous voulez. Il y a plusieurs couleurs et textures, idéal pour vos projets créatifs.", vendeurPseudo: "Bastien42", vendeurImage: "", vendeurNote: 4.8, localisation: "Lyon", vendeurTexte: nil, prix: nil, typeMateriel: "Don"),
        Materiel(nom: "Cuir coloré", image: "cuir.Img", description: "J'échange des morceaux de cuir coloré, parfaits pour customiser vos sacs, accessoires ou petites créations DIY.", vendeurPseudo: "Marie90", vendeurImage: "", vendeurNote: 4.2, localisation: "Lille", vendeurTexte: nil, prix: nil, typeMateriel: "Échange"),
        Materiel(nom: "Tissu à motif", image: "tissu.Img", description: "J’ai ces tissus à motifs à donner, idéal pour la couture ou encore des projets déco.", vendeurPseudo: "Leti_To", vendeurImage: "", vendeurNote: 4.9, localisation: "Tulle", vendeurTexte: nil, prix: nil, typeMateriel: "Don"),
        Materiel(nom: "Bobine de fil", image: "bobines.Img", description: "Je donne une bobine de fil, pratique pour tous vos travaux de couture ou vos projets DIY.", vendeurPseudo: "Thomas2132", vendeurImage: "", vendeurNote: 4.0, localisation: "Paris", vendeurTexte: nil, prix: nil, typeMateriel: "Don"),
        Materiel(nom: "Laine rose", image: "laineRose.Img", description: "J'échange cette pelote de laine rose toute douce, parfaite pour vos tricots ou crochet colorés.", vendeurPseudo: "Nath_Del", vendeurImage: "", vendeurNote: 4.5, localisation: "Toulouse", vendeurTexte: nil, prix: nil, typeMateriel: "Échange"),
        Materiel(nom: "Crochet 10mm", image: "crochet.Img", description: "Je donne ce crochet 10 mm, idéal pour tricoter ou crocheter des pièces plus épaisses facilement.", vendeurPseudo: "Jules", vendeurImage: "", vendeurNote: 4.3, localisation: "Marseille", vendeurTexte: nil, prix: nil, typeMateriel: "Don")
    ]
    
    // Données pour Neuf
    let materielsNeuf: [Materiel] = [
        Materiel(nom: "Carnet de dessin", image: "carnet.Img", description: "Libérez votre créativité avec ce carnet de dessin de qualité supérieure ! Ses pages épaisses et lisses sont parfaites pour les croquis, les esquisses et les illustrations détaillées. Format pratique pour emporter partout, que vous soyez à la maison, en voyage ou en balade. L’allié idéal de tous les artistes, débutants comme confirmés.", vendeurPseudo: nil, vendeurImage: nil, vendeurNote: nil, localisation: nil, vendeurTexte: "Vendu par Emmaüs", prix: "3,50 €", typeMateriel: nil),
        Materiel(nom: "Crayons", image: "crayons.Img", description: "Pack complet de crayons pour artistes, offrant une large gamme de duretés pour toutes vos créations. Idéaux pour le dessin, l’esquisse et le shading, ces crayons garantissent un tracé précis et uniforme. Que vous soyez amateur ou professionnel, ils deviendront rapidement vos compagnons indispensables.", vendeurPseudo: nil, vendeurImage: nil, vendeurNote: nil, localisation: nil, vendeurTexte: "Vendu par Mosaïk", prix: "3,00 €", typeMateriel: nil),
        Materiel(nom: "Palette d’aquarelle", image: "aquarelle.Img", description: "Palette d’aquarelle compacte et pratique, avec des pigments riches et intenses. Mélangez facilement vos couleurs pour obtenir des effets dégradés ou des nuances subtiles. Parfaite pour les artistes en déplacement ou pour un usage quotidien à la maison. Donnez vie à vos œuvres avec des couleurs éclatantes !", vendeurPseudo: nil, vendeurImage: nil, vendeurNote: nil, localisation: nil, vendeurTexte: "Vendu par Geev Shop", prix: "4,00 €", typeMateriel: nil),
        Materiel(nom: "Lot de pinceaux", image: "pinceaux.Img", description: "Lot de pinceaux polyvalent pour toutes vos techniques de peinture. Poils doux et résistants pour un contrôle parfait et une application fluide de la peinture. Idéal pour l’aquarelle, l’acrylique ou l’huile. Un set incontournable pour les artistes qui veulent précision et qualité à chaque coup de pinceau.", vendeurPseudo: nil, vendeurImage: nil, vendeurNote: nil, localisation: nil, vendeurTexte: "Vendu par Emmaüs AGIR", prix: "2,00 €", typeMateriel: nil)
    ]
    
    var filteredMateriels: [Materiel] {
        let list = condition == "Occasion" ? materielsOccasion : materielsNeuf
        return searchText.isEmpty ? list :
        list.filter { $0.nom.localizedCaseInsensitiveContains(searchText) }
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .purple.opacity(0.1)]),
                    startPoint: .topLeading,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Rechercher un matériel", text: $searchText)
                            .textFieldStyle(PlainTextFieldStyle())
                            .mainText()
                        Button(action: {
                            }) {
                                Image(systemName: "mic.fill")
                                    .foregroundColor(.gray)
                                    .padding(6)
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                            }
                        }
                    .padding(10)
                    .background(Color(.white))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        Button(action: { showingFilter.toggle() }) {
                            Image(systemName: "slider.vertical.3")
                                .font(.title3)
                                .foregroundColor(.primaryPurpule)
                                .padding(10)
                                .background(Color(.white))
                                .clipShape(Circle())
                        }
                        .sheet(isPresented: $showingFilter) {
                            VStack {
                                Text("Filtres disponibles")
                                    .secondaryTitle()
                                    .padding()
                                Button("Fermer") { showingFilter = false }
                                    .buttonLabel()
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
                    
                    Spacer()
                    
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
                                                            .fill(type == "Don" ? Color.primaryPurpule.opacity(0.7) : Color.primaryPurpule.opacity(0.7))
                                                    )
                                                    .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                                                    .offset(x: 20, y: 9)
                                            }
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(materiel.nom)
                                                .tertiaryTitle()
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(1)
                                                .padding(.horizontal, 8)
                                            
                                            Text(materiel.description)
                                                .secondaryText()
                                                .foregroundColor(.gray)
                                                .multilineTextAlignment(.leading)
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
        }
    }
}

#Preview {
    MaterielView()
}


