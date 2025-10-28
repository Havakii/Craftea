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

    var body: some View {
        NavigationStack{
            ZStack{
                Color.background.ignoresSafeArea()
                
                // tout le contenu
                VStack{
                    //Le message en haut
                    ZStack(alignment: .topLeading){
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
                                }.padding(.top,32)
                                Spacer()
                            }.padding(.horizontal, 24)
                                .offset(y: -80)
                        }
                            
                        //Bare de filtre
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
                                                //TODO : add my filters

                                                ForEach(Level.AllCases(), id: \.self) { level in
                                                    Button {

                                                    } label: {
                                                        Text(level.rawValue)
                                                            .padding(.vertical, 8)
                                                            .padding(.horizontal, 12)
                                                            .glassEffect(selectedFilters.contains(level) ? .regular.tint(.primaryPurpule).interactive() :
                                                                    .regular.interactive())
                                                            .foregroundStyle(selectedFilters.contains(level) ? .white : .textPrimary)
                                                    }

                                                    
                                                    
                                                    
                                                }
                                            }
                                        }
                                    }
                                    Spacer()
                                }
                            }.zIndex(10)
                                .padding(.top, hasScrolled ? 0 : 50)
                            
                        
                    }
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(alignment: .leading, spacing: 24){
                            
                            
                            // Loisir Recommandées
                            Text("Loisirs recommandés")
                                .mainTitle()
                                .foregroundStyle(Color.textPrimary)
                            //TODO : add vertical hobbies list of recommadations
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(hobbies) { hobby in //use an other tab of recomanded hobbies
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
                                    ForEach(hobbies) { hobby in
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
            
            .searchable(text: $searchText, placement:.toolbarPrincipal,prompt: "Rechercher un loisir")
        }
    }
}

#Preview {
    DecouvrirView(user: users[0])
}
