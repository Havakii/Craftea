//
//  ProfilView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

struct ProfilView: View {

    @Environment(Session.self) private var session
    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false
    let viewModel = HobbyViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                // background
                Color.background.ignoresSafeArea()
                LinearGradient(gradient: Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]),
                               startPoint: .topLeading, endPoint: .bottom)
                .ignoresSafeArea()
                // Contenue Principal
                ScrollView {
                    VStack (spacing: 24) {
                        //Profil Image
                        VStack (spacing: 8) {
                            ProfileProgressView(
                                progress: 0.75, // 75% rempli
                                image: Image(session.currentUser.imageProfil ?? "placeholder")
                            )
                            HStack(spacing: 8) {
                                Text("\(session.currentUser.name)").mainTitle()
                                ScoreTag(score: session.currentUser.score)                          }

                        }
                        // Section Loisirs
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Mes Loisirs").mainTitle()
                                .padding(.horizontal, 15)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack (spacing: 12) {
                                    VerticalHobbyView(hobby: viewModel.hobbies[0])
                                    ForEach(session.currentUser.favoritesHobby) { hobby in
                                        VerticalHobbyView(hobby: hobby)
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 10)
                            }
                        }
                        // Section Favoris
                        if
                            !session.currentUser.favoriteEquipment.isEmpty || !session.currentUser.favoriteEquipmentPro.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Mes Favoris").mainTitle()
                                    .padding(.horizontal, 15)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack (spacing: 12) {
                                        ForEach(session.currentUser.favoriteEquipment) { materiel in
                                            MaterielCard(materiel: materiel)
                                            ForEach(session.currentUser.favoriteEquipmentPro) { materiel in
                                                MaterielCardPro(materiel: materiel)
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 10)
                                }
                            }
                        }

                    }

                    // Section Articles de troc
                    VStack(alignment: .leading) {
                        Text("Mes Articles de Troc").mainTitle()
                            .padding(.horizontal, 15)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(materielsOccasion) { materiel in
                                    materiel.vendeur.id == session.currentUser.id ? MaterielCard(materiel: materiel) : nil
                                }
                            }
                            .padding(.horizontal, 24)


                            // Bouton dans la Toolbar
                            .toolbar {
                                ToolbarItem(placement: .topBarTrailing) {
                                    NavigationLink(destination: SettingsView(user: session.currentUser)) {
                                        Image(systemName: "gearshape.fill")
                                    }
                                    .tint(.primaryPurpule)

                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProfilView()
        .environment(Session(currentUser: users[0]))
        .environment(HobbyViewModel())
}
