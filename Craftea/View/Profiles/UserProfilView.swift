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
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Ses Loisirs").mainTitle()
                            .padding(15)
                        ScrollView (.horizontal) {
                            HStack {
                                ForEach(otherUser.favoritesHobby ) { hobby in VerticalHobbyView(hobby: hobby)}
                                .padding(.trailing ,20)}
                            .padding(20)
                        }
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text("Ses Articles de Troc").mainTitle()
                            .padding(15)
                        ScrollView (.horizontal) {
                            HStack {
    MaterielCard(materiel:materielsOccasion[1])
    MaterielCardPro(materiel:materielsNeuf[0])
                            }
                            .padding(20)
                            
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
        .environment(Session(currentUser: users[2]))
}
