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
    
//    var filteredMateriels: [Materiel] {
//        //let list = condition == "Occasion" ? materielsOccasion : materielsNeuf
//        var filtered = searchText.isEmpty ? materielsOccasion :
//        materielsOccasion.filter { $0.nom.localizedCaseInsensitiveContains(searchText) }
//        
//        if condition == "Occasion", !selectedFilters.isEmpty {
//            filtered = filtered.filter { materiel in
//                //if let type = materiel.typeMateriel {
//                    return selectedFilters.contains(type.rawValue)
//                //}
//                //return false
//            }
//        }
//        return filtered
//    }
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
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
                        //Filtre
                        
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
                         ForEach(EquipmentCategory.allCases, id: \.self) { type in
                         Button {
                         withAnimation {
                         if selectedFilters.contains(type) {
                         selectedFilters.removeAll { $0 == type }
                         } else {
                         selectedFilters.append(type)
                         }
                         }
                         } label: {
                         Text(type.rawValue)
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
                         
    
                    // Les cartes de materiel
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            if condition == "Occasion" {
                                //Si on affiche le materiel d'occasion
                                ForEach(filteredMateriels) { materiel in
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
//                                                Image(materiel.image)
//                                                    .resizable()
//                                                    .scaledToFit()
//                                                    .frame(height: 139)
//                                                    .clipShape(RoundedRectangle(cornerRadius: 8))
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
//                                                Image(materiel.image)
//                                                    .resizable()
//                                                    .scaledToFit()
//                                                    .frame(height: 120)
//                                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                                
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
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                            }.buttonStyle(.glassProminent).tint(Color.primaryPurpule.opacity(0.6))
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
                Task {
                await loadCoverImages()
                    await loadCoverImagesPro()
                }
            }
        }
    }
}

#Preview {
    MaterielView()
}
