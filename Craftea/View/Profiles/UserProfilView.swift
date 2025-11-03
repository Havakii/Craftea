//
//  UserProfilView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI
struct UserProfilView: View {
    @Environment(User.self) private var user
    @State private var showingAlert = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer(minLength: 100)
                    ProfileProgressView(
                        progress: 1.0, // 75% rempli
                        image: Image("user2")
                    )
                    HStack{
                        Text(user.pseudo).mainTitle()
                       ScoreTag()
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                }
                VStack(alignment: .leading) {
                    Text("Ses Loisirs").mainTitle()
                        .padding(15)
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(user.favoritesHobby ) { hobby in VerticalHobbyView(hobby: hobby)}
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
                            ForEach(user.favoriteEquipment) { materiel in MaterielCard(materiel: materiel)}
                                .padding(.trailing ,20)
                        }
                        .padding(20)
                        
                    }
                    Spacer()
                }
            }
            .background(LinearGradient(gradient:Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottom))
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ProfilSignalButton()
                }
            }
        }
    }
}
#Preview {
    UserProfilView().environment(users[2])
}
