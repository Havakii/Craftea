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
                ScrollView {
                    VStack (spacing: 24) {
                        //Profil Image
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
                        }
                        //Section Ses Loisirs
                        if !otherUser.favoritesHobby.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Ses Loisirs").mainTitle()
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack (spacing: 24) {
                                        ForEach(otherUser.favoritesHobby ) { hobby in VerticalHobbyView(hobby: hobby)}
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                        }
                        //Section Article de Troc
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Ses Articles de Troc").mainTitle()
                            //.padding(15)
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack (spacing: 24) {
                                    if !materielsOccasion.isEmpty {
                                        MaterielCard(materiel: materielsOccasion[1])
                                    }
                                    if !materielsNeuf.isEmpty {
                                        MaterielCardPro(materiel: materielsNeuf[0])
                                    }
                                }
                            }
                            Spacer(minLength: 30)
                        }
                        .padding(.horizontal, 24)
                    }
                }
                //Button Signalement !
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
        .environment(Session(currentUser: users[2]))
}
