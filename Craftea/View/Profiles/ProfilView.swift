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
                ScrollView {
                    VStack {
                        Spacer(minLength: 10)
                        ProfileProgressView(
                            progress: 0.75, // 75% rempli
                            image: Image("user1")
                        )
                        HStack {
                            Text("\(session.currentUser.name)").mainTitle()
                            ScoreTag(score: session.currentUser.score)                        }
                        .padding(.top)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                    }
                    // Section Loisirs
                    VStack(alignment: .leading) {
                        Text("Mes Loisirs").mainTitle()
                            .padding(.horizontal, 15)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                VerticalHobbyView(hobby: viewModel.hobbies[0])
                                ForEach(session.currentUser.favoritesHobby) { hobby in
                                    VerticalHobbyView(hobby: hobby)
                                }
                                .padding(.trailing, 20)
                            }
                            .padding(.horizontal, 24)

                        }
                    }
                    // Section Favoris
                    if !session.currentUser.favoriteEquipment.isEmpty || !session.currentUser.favoriteEquipmentPro.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Mes Favoris").mainTitle()
                                .padding(.horizontal, 15)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {

                                    ForEach(session.currentUser.favoriteEquipment) { materiel in
                                        MaterielCard(materiel: materiel)
                                        ForEach(session.currentUser.favoriteEquipmentPro) { materiel in
                                            MaterielCardPro(materiel: materiel)
                                        }
                                        .padding(.trailing, 20)

                                    }
                                    .padding(.horizontal, 24)
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
                                MaterielCard(materiel:materielsOccasion[2])
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
                            Spacer(minLength: 30)
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
