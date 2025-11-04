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
                            ScoreTag()
                            
                        }
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
                                
                                ForEach(session.currentUser.favoritesHobby) { hobby in
                                    VerticalHobbyView(hobby: hobby)
                                }
                                .padding(.trailing, 20)
                            }
                            .padding(.horizontal, 20)
                            
                        }
                    }
                    // Section Favoris
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
                                .padding(.horizontal, 20)
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
                                    .padding(.trailing, 20)
                                }
                                .padding(.horizontal, 20)
                            }
                        }
                        Spacer(minLength: 30)
                    }
                    // Bouton dans la Toolbar
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink(destination: SettingsView()) {
                                Image(systemName: "gearshape.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("primaryPurpule"))
                                    .padding(15)
                                    .background(
                                        Circle()
                                            .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 3)
                                    )
                            }
                            .buttonStyle(PlainButtonStyle())
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
