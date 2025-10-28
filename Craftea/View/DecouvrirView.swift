//
//  Untitled.swift
//  Craftea
//
//  Created by Lora-Line on 27/10/2025.
//

import SwiftUI

struct DecouvrirView: View {
    @State var user : User
    @State var searchText: String = ""
    @State private var hasScrolled: Bool = false
    @State private var isExpanded: Bool = true
    @State var selectedFilters: [Level] = []
    
    var filteredData: [Hobby] {
        hobbies.filter { hobby in
            // Text filtering: if search is empty, accept all; otherwise check hobbby name
            let matchesSearch: Bool = searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ? true
            : hobby.name.rawValue.localizedCaseInsensitiveContains(searchText)
            
            // difficulty filtering
            let matchesFilters: Bool = selectedFilters.isEmpty || selectedFilters.contains(hobby.level)
            
            return matchesSearch && matchesFilters
        }
    }
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.background.ignoresSafeArea()
                
                // tout le contenu
                VStack{
                    //Le message en haut
                    
                        
                        //disparait quand on scroll
                        if !hasScrolled {
                           
                                HStack(){
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Bonjour \(user.name) !")
                                            .mainTitle()
                                            .foregroundStyle(Color.primaryPurpule)
                                        Text("Sois creatif aujourd'hui")
                                            .secondaryTitle()
                                            .foregroundStyle(Color.textSecondary)
                                    }
                                    Spacer()
                                }.padding(.horizontal, 24)
                            }
                        
                        
                        // Barre de recherche, .searchable fonctionne pas avec le texte et la barre de filtres
                        GlassEffectContainer() {
                            HStack(spacing: 8) {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundStyle(Color.textSecondary)
                                TextField("Rechercher un loisir", text: $searchText)
                                    .textInputAutocapitalization(.never)
                                    .disableAutocorrection(true)
                                    .foregroundStyle(Color.textPrimary)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 12)
                        }.glassEffect()
                            .padding(.top, hasScrolled ? 20 : 0)
                            .padding(.horizontal)
                        
                        //Barre de filtre
                        GlassEffectContainer(spacing: 12.0) {
                            HStack() {
                                //Toggle button
                                Button(action: {
                                    withAnimation {
                                        isExpanded.toggle()
                                        
                                    }
                                }) {
                                    Image(systemName: "slider.vertical.3")
                                    //.frame(width: 32, height: 44)
                                        .font(.system(size: 20, weight:  .semibold))
                                        .foregroundStyle(Color.primaryPurpule)
                                }
                                .buttonStyle(.glass)
                                .zIndex(10)
                                .padding(.leading)
                                //.glassEffectID("filter.toggle.search", in: filterNamespace)
                                
                                if isExpanded {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 8) {
                                            
                                            ForEach(Level.allCases, id: \.self) { level in
                                                Button {
                                                    withAnimation {
                                                        if selectedFilters.contains(level) {
                                                            selectedFilters.removeAll { $0 == level }
                                                        } else {
                                                            selectedFilters.append(level)
                                                        }
                                                        
                                                        //generateItem() //TODO
                                                    }
                                                } label: {
                                                    Text(level.rawValue).buttonLabel()
                                                        .padding(.vertical, 8)
                                                        .padding(.horizontal, 12)
                                                        .glassEffect(selectedFilters.contains(level) ? .regular.tint(.primaryPurpule.opacity(0.6)).interactive() :
                                                                .regular.interactive())
                                                        .foregroundStyle(selectedFilters.contains(level) ? .white : .textPrimary)
                                                }
                                                
                                            }
                                        }
                                    }
                                }
                                Spacer()
                            }
                        }
                        .padding(.top, 8)
                    
                    
                
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading, spacing: 24){
                        
                        
                        // Loisir Recommandées
                        Text("Loisirs recommandés")
                            .mainTitle()
                            .foregroundStyle(Color.textPrimary)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(filteredData) { hobby in //use an other tab of recomanded hobbies
                                    VerticalHobbyView(hobby: hobby)
                                }
                            }
                        }
                        // Loisirs Populaires
                        Text("Loisirs populaires")
                            .mainTitle()
                            .foregroundStyle(Color.textPrimary)
                        //TODO : add horizontal hobbies random
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 12) {
                                ForEach(filteredData) { hobby in
                                    HorizontalHobbyView(hobby: hobby)
                                }
                            }
                        }
                        // Loisirs Populaires
                        Text("Tout les loisirs")
                            .mainTitle()
                            .foregroundStyle(Color.textPrimary)
                        //TODO : add all hobbies
                        
                    }.padding(.horizontal, 24)
                }.onScrollGeometryChange(for: CGFloat.self) { proxy in
                    proxy.contentOffset.y
                } action: { y, _  in
                    withAnimation(.easeInOut) {
                        hasScrolled = y > 5 // ICI : règle le seuil comme tu veux
                    }
                }
            }
        }
        //            .toolbar {
        //                ToolbarItem(placement: .principal) {
        //
        //                    HStack(){
        //                        VStack(alignment: .leading, spacing: 4) {
        //                            Text("Bonjour \(user.name) !")
        //                                .mainTitle()
        //                                .foregroundStyle(Color.primaryPurpule)
        //                            Text("Sois creatif aujourd'hui")
        //                                .secondaryTitle()
        //                                .foregroundStyle(Color.textSecondary)
        //                        }.padding(.top,32)
        //                        Spacer()
        //                    }
        //
        //                }
        //            }
        .scrollIndicators(.hidden)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}
}

#Preview {
    DecouvrirView(user: users[0])
}
