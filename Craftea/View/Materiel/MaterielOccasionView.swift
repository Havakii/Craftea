//
//  MaterielOccasionView.swift
//  Craftea
//
//  Created by apprenant75 on 30/10/2025.
//

import SwiftUI

struct MaterielOccasionView: View {
    let materiel: Materiel
    @Environment(\.dismiss) private var dismiss
    @State private var isLiked = false
    @Environment(Session.self) private var session
    @Environment(ConversationStore.self) private var conversationStore
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            LinearGradient(
                gradient: Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 24) {
                        AsyncImage(url: URL(string: materiel.image)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 345,height: 345)
                                    .frame(maxWidth: .infinity)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 345,height: 345)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .shadow(radius: 4)
                            case .failure(_):
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.almostWhite)
                                    .frame(height: 300)
                                    .frame(maxWidth: .infinity)
                                    .shadow(radius: 2)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        HStack(alignment: .center, spacing: 8) {
                            Text(materiel.nom)
                                .secondaryTitle()
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 7)
                            
                            Spacer()
                            
                            Text(materiel.typeMateriel.rawValue)
                                .categoryText()
                                .foregroundColor(.primaryPurpule)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 6)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.ultraThinMaterial)
                                            .fill(Color.white.opacity(0.9))
                                            .stroke(Color.white.opacity(0.25), lineWidth: 0.5)
                                    }
                                )
                                .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 1)
                        }
                        .padding(.horizontal, 7)
                        
                            HStack(alignment: .center, spacing: 12) {
                                NavigationLink(destination: UserProfilView(otherUser: materiel.vendeur)){
                                    Image(materiel.image.isEmpty ? "placeholder" : materiel.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Color.primaryPurpule.opacity(0.5), lineWidth: 2)
                                        )

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(materiel.vendeur.pseudo)
                                            .mainText(bold: true)
                                            .foregroundColor(Color.textPrimary)

                                        Text(String(format: "%.1f ★", materiel.vendeur.score))
                                            .secondaryText()
                                            .bold()
                                            .foregroundColor(.orange.opacity(0.7))
                                            .padding(.horizontal, 9)
                                            .padding(.vertical, 2)
                                            .background(
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 6)
                                                        .fill(.ultraThinMaterial)
                                                        .fill(Color.yellow.opacity(0.6))
                                                        .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                                                }
                                            )
                                    }

                                    Spacer()
                                }
                                NavigationLink(
                                    destination: MessageDetailView(
                                        conversation: conversationStore.getOrCreateConversation(
                                            currentUser: session.currentUser,
                                            otherUser: materiel.vendeur,
                                            theme: "À propos de \(materiel.nom)"
                                        )
                                    )
                                ){
                                    Text("Contacter")
                                        .buttonLabel()
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 10)
                                        .background(
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(.ultraThinMaterial)
                                                    .fill(Color.primaryPurpule.opacity(0.6))
                                                    .stroke(Color.white.opacity(0.25), lineWidth: 0.5)
                                            }
                                        )
                                        .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 2)
                                }

                        }
                        .padding(.horizontal, 7)
                        .padding(.top, -8)
                        
                        HStack(spacing: 6) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.primaryPurpule)
                            Text(materiel.vendeur.location ?? "inconnu")
                                .secondaryText()
                                .foregroundColor(.textSecondary)
                            Spacer()
                        }
                        .padding(.horizontal, 7)
                        
                        HStack {
                            Text(materiel.description)
                                .mainText()
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .lineSpacing(4)
                                .padding(.horizontal, 7)
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primaryPurpule)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        if session.currentUser.self.favoriteEquipment.contains(where: { $0.id == materiel.id }) {
                            session.currentUser.favoriteEquipment.removeAll(where: { $0.id == materiel.id })
                            session.currentUser.score -= 5
                        } else {
                            session.currentUser.favoriteEquipment.append(materiel)
                            session.currentUser.score += 5
                        }
                    }) {
                        Label("Favorite", systemImage: session.currentUser.favoriteEquipment.contains(where: { $0.id == materiel.id }) ? "heart.fill" : "heart")
                    }
                }
            }
        }
    }
    
}


#Preview {
    MaterielOccasionView(materiel: materielsOccasion[0])
        .environment(Session(currentUser: users[0]))
        .environment(ConversationStore())
}

