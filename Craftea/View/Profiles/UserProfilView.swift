//
//  UserProfilView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI
struct UserProfilView: View {
    @Environment(Session.self) private var session
    var otherUser: User
    @State private var showingAlert = false
    var body: some View {

        NavigationStack {
            ZStack {
                // background
                Color.background.ignoresSafeArea()
                LinearGradient(gradient: Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]),
                               startPoint: .topLeading, endPoint: .bottom)
                .ignoresSafeArea()
                ScrollView( showsIndicators: false) {
                    VStack {
                        Spacer(minLength: 10)
                        ProfileProgressView(
                            progress: 1.0, // 75% rempli
                            image: Image("user2")
                        )
                        HStack{
                            Text(otherUser.pseudo).mainTitle()
                            ScoreTag(user: users[2])
                        }

                    }.padding(.bottom, 24)
                    VStack(alignment: .leading) {
                        Text("Ses Loisirs").mainTitle().padding(.horizontal, 24)
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(otherUser.favoritesHobby ) { hobby in VerticalHobbyView(hobby: hobby)
                                }
                            }.padding(.horizontal, 24)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Ses Articles de Troc").mainTitle().padding(.horizontal, 24)
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(materielsOccasion) { materiel in
                                    materiel.vendeur.id == otherUser.id ? MaterielCard(materiel: materiel) : nil
                                }
                            }.padding(.horizontal, 24)

                        }
                        Spacer()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        ProfilSignalButton()
                    }
                }
            }
        }
    }
}
#Preview {
    UserProfilView(otherUser: users[2]).environment(HobbyViewModel())
        .environment(Session(currentUser: users[0])).environment(ConversationStore())
}
