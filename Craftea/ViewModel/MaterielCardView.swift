//
//  MaterielCardView.swift
//  Craftea
//
//  Created by Andréa  on 31/10/2025.
//

import SwiftUI

struct MaterielCardView: View {
    @State private var searchText = ""
    var searchTextfromDetailView: String = ""
    @State private var condition: String = "Occasion"

    @State private var selectedFilters: [EquipmentCategory] = []
    
    var filteredMateriels: [Materiel] {
        // Choose the source list based on the current condition
        let list: [Materiel] = materielsOccasion
        
        // Normalize search text once
        let trimmedSearch = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let hasSearch = !trimmedSearch.isEmpty
        
        // Base filtering for search (applies to both lists)
        var result = list.filter { materiel in
            let matchesSearch: Bool = hasSearch ? materiel.nom.localizedCaseInsensitiveContains(trimmedSearch) : true
            return matchesSearch
        }
        
        // Additional filtering by category only for Occasion
        if condition == "Occasion", !selectedFilters.isEmpty {
            result = result.filter { materiel in
                selectedFilters.contains(materiel.typeMateriel)
            }
        }
        
        return result
    }
    
    var filteredMaterielsNeuf: [MaterielPro] {
        // Source list for Neuf
        let list: [MaterielPro] = materielsNeuf
        
        // Normalize search text once
        let trimmedSearch = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let hasSearch = !trimmedSearch.isEmpty
        
        // Base filtering for search (applies to Neuf list)
        let result = list.filter { materiel in
            let matchesSearch: Bool = hasSearch ? materiel.nom.localizedCaseInsensitiveContains(trimmedSearch) : true
            return matchesSearch
        }
        
        return result
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        // Les cartes de materiel
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                if condition == "Occasion" {
                    //Si on affiche le materiel d'occasion
                    ForEach(filteredMateriels.prefix(4)) { materiel in
                        NavigationLink(destination: MaterielOccasionView(materiel: materiel)) {
                            //l'image a modifier en asycimage
                            VStack(alignment: .leading) {
                                ZStack(alignment: .topTrailing) {
                                    AsyncImage(url: URL(string: materiel.image)) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 148.5, height: 139)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 148.5,height: 139)
                                    }
                                    
                                    Text(materiel.typeMateriel.rawValue)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 119/255, green: 87/255, blue: 208/255))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .glassEffect(.regular.tint(.primaryPurpule.opacity(0.3))
                                                     ,in : RoundedRectangle(cornerRadius: 8))
                                        .offset(x: -4, y: 4)
                                    
                                }
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(materiel.nom)
                                        .tertiaryTitle()
                                        .foregroundColor(.textPrimary)
                                        .lineLimit(1)
                                        .padding(.horizontal, 8)
                                    
                                    Text(materiel.description)
                                        .secondaryText()
                                        .foregroundColor(.textSecondary)
                                        .lineLimit(1)
                                        .padding(.horizontal, 8)
                                        .padding(.bottom, 8)
                                }
                            }.padding(8)
                                .frame(width: 164.5 ,height: 216)
                            
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.almostWhite)
                                        .shadow(radius: 2)
                                )
                        }
                    }
                } else {
                    //Si on affiche le materiel neuf
                    ForEach(filteredMaterielsNeuf) { materiel in
                        NavigationLink(destination: MaterielNeufView(materiel: materiel, )) {
                            //l'image
                            VStack(alignment: .leading) {
                                ZStack(alignment: .topTrailing) {
                                    AsyncImage(url: URL(string: materiel.image)) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 148.5, height: 139)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 148.5,height: 139)
                                    }
                                    
                                }
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(materiel.nom)
                                        .tertiaryTitle()
                                        .foregroundColor(.textPrimary)
                                        .lineLimit(1)
                                        .padding(.horizontal, 8)
                                    
                                    Text(materiel.description)
                                        .secondaryText()
                                        .foregroundColor(.textSecondary)
                                        .lineLimit(1)
                                        .padding(.horizontal, 8)
                                        .padding(.bottom, 8)
                                }
                            }.padding(8)
                                .frame(height: 200)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.almostWhite)
                                        .shadow(radius: 2)
                                )
                        }
                    }
                }
                
            }.padding(.horizontal, 24).padding(.vertical)
        }
    }
}

#Preview {
    MaterielCardView()
}
