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
    @State private var selectedPriceFilter: PriceRange = .all
    
    var filteredMateriels: [Materiel] {
        let list: [Materiel] = materielsOccasion
        
        let trimmedSearch = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let hasSearch = !trimmedSearch.isEmpty
        
        var result = list.filter { materiel in
            let matchesSearch: Bool = hasSearch ? materiel.nom.localizedCaseInsensitiveContains(trimmedSearch) : true
            return matchesSearch
        }
        
        if condition == "Occasion", !selectedFilters.isEmpty {
            result = result.filter { materiel in
                selectedFilters.contains(materiel.typeMateriel)
            }
        }
        
        return result
    }
    
    var filteredMaterielsNeuf: [MaterielPro] {
        let list: [MaterielPro] = materielsNeuf
        
        let trimmedSearch = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let hasSearch = !trimmedSearch.isEmpty
        
        var result = list.filter { materiel in
            let matchesSearch: Bool = hasSearch ? materiel.nom.localizedCaseInsensitiveContains(trimmedSearch) : true
            return matchesSearch
        }
        
        if selectedPriceFilter != .all {
            result = result.filter { materiel in
                if let prix = Double(materiel.prix) {
                    return selectedPriceFilter.contains(prix)
                } else {
                    return false
                }
            }
        }
        return result
    }
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
                    } else {
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
                                            ForEach(PriceRange.allCases) { range in
                                                Button {
                                                    withAnimation {
                                                        selectedPriceFilter = range
                                                    }
                                                } label: {
                                                    Text(range.rawValue)
                                                        .buttonLabel()
                                                        .padding(.vertical, 8)
                                                        .padding(.horizontal, 12)
                                                        .glassEffect(selectedPriceFilter == range ?
                                                            .regular.tint(.primaryPurpule.opacity(0.6)).interactive() :
                                                                .regular.interactive())
                                                        .foregroundStyle(selectedPriceFilter == range ? .white : .textPrimary)
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
                    
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            if condition == "Occasion" {
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
                                ForEach(filteredMaterielsNeuf) { materiel in
                                    NavigationLink(destination: MaterielNeufView(materiel: materiel, )) {
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
