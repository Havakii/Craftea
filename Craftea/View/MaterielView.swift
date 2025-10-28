//
//  MaterielView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

struct MaterielVue: View {
    @State private var searchText = ""
    @State private var condition: String = "Occasion"
    @State private var showingFilter = false
    
    struct Materiel: Identifiable {
        let id = UUID()
        let nom: String
        let image: String
        let description: String
    }
    
    let materiels: [Materiel] = [
        Materiel(nom: "Lot de pelotes de laine", image: "pelotes", description: "Je donne un lot de pelote de laine."),
        Materiel(nom: "Cuir coloré", image: "cuir", description: "Cherche personne qui donne du cuir de couleur."),
        Materiel(nom: "Tissu à motif", image: "tissu", description: "Bonjour, je donne des tissus à motifs variés."),
        Materiel(nom: "Bobine de fil", image: "fil", description: "Ne me servant plus de ces bobines, je cherche quelqu'un à qui je pourrais en faire don."),
        Materiel(nom: "Laine rose", image: "laine_rose", description: "Je n'utilise plus cette laine et j'aimerais en faire don."),
        Materiel(nom: "Crochet 9mm", image: "crochet", description: "Ces crochets ne me sont plus utiles, en ayant acheté d'autres j'aimerais donner ceux-ci.")
    ]
    
    var filteredMateriels: [Materiel] {
        let searchFiltered = searchText.isEmpty ? materiels :
            materiels.filter { $0.nom.localizedCaseInsensitiveContains(searchText) }
        
        return searchFiltered
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
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
                
                HStack {
                Button(action: {
                           showingFilter.toggle()
                       }) {
                           Image(systemName: "line.3.horizontal.decrease.circle")
                               .font(.title3)
                               .foregroundColor(.purple)
                               .padding(10)
                               .background(Color(.systemGray6))
                               .clipShape(Circle())
                       }
                       .sheet(isPresented: $showingFilter) {
                           VStack {
                               Text("Filtres disponibles")
                                   .font(.headline)
                                   .padding()
                               Text("")
                                   .multilineTextAlignment(.center)
                                   .padding()
                               Button("Fermer") {
                                   showingFilter = false
                               }
                               .padding()
                           }
                           .presentationDetents([.fraction(0.3)])
                       }
                   }
                .padding(.horizontal)
                .padding(.top)
                
                HStack(spacing: 0) {
                    Button(action: { condition = "Occasion" }) {
                        Text("Occasion")
                            .foregroundColor(condition == "Occasion" ? .black : .gray)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(condition == "Occasion" ? Color.white : Color.clear)
                    }
                    
                    NavigationLink(destination: MaterielNeufVue()) {
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
                                Image(materiel.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .padding(.top, 8)
                                
                                Spacer()
                                
                                Text(materiel.nom)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                    .padding(.horizontal, 8)
                                
                                Text(materiel.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
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
                HStack {
                    Spacer()
                    Button(action: {
                        print("Publier un article")
                    }) {
                        Text("Publier un article")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                    .frame(width: 160)
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
            }
            .background(Color("beigeFond"))
        }
    }
}

#Preview {
    MaterielVue()
}


