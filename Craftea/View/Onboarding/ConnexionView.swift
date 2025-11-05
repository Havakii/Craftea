//
//  ConnexionView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

struct ConnexionView: View {
    // Environment & State
    @Environment(Session.self) private var session
    @State private var mail: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isConnected: Bool = false
    @State private var showAlert: Bool = false
    @State private var connectedUser: User? = nil
    
    // View Body
    var body: some View {
        NavigationStack {
            ZStack {
                // Background couleur
                Color("Background")
                    .ignoresSafeArea()

                VStack(spacing: 30) {
               // Logo + Texte d'accueil
                    VStack {
                        Image("CrafteaLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())

                        Text("C'EST COOL DE TE REVOIR !")
                            .font(.custom("Manrope-Bold", size: 36))
                            .fontWeight(.bold)
                            .padding(.bottom, 20)
                    }

                   // Champs de connexion
                    VStack(spacing: 20) {
                        // Champ mail
                        TextField("Mail", text: $mail)
                            .keyboardType(.emailAddress)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                        // Champ mot de passe
                        HStack {
                            if isPasswordVisible {
                                TextField("Mot de passe", text: $password)
                            } else {
                                SecureField("Mot de passe", text: $password)
                            }
                            Button(action: {
                                withAnimation { isPasswordVisible.toggle() }
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5))
                        )
                        .background(Color.white)
                    }

                    // Mot de passe oublié
                    HStack {
                        Spacer()
                        Button("Mot de passe oublié ?") { }
                            .font(.custom("Inter_24pt-Regular", size: 15))
                            .foregroundColor(.black)
                            .underline()
                    }

                    // Bouton de connexion

                    NavigationLink(
                        destination: ContentView(), isActive: $isConnected) {
                            Button(action: login) {
                        HStack {
                            Text("Me connecter")
                                .font(.custom("Manrope-Bold", size: 20))
                                .foregroundColor(.white)
                            Image(systemName: "arrow.up.right")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color("primaryPurpule"))
                        .cornerRadius(10)
                    }
                    .alert("Identifiants incorrects", isPresented: $showAlert) {
                        Button("OK", role: .cancel) {}
                    }

                    }

                    Spacer()
                  // Lien vers inscription
                    HStack {
                        Text("Tu n'as pas de compte ?")
                            .font(.custom("Inter_24pt-Regular", size: 15))
                        NavigationLink(destination: InscriptionView()) {
                            Text("S'inscrire")
                                .font(.custom("Manrope-Bold", size: 15))
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
            }.navigationBarBackButtonHidden(true)
        }
    }

    // Fonctions
    // Vérifie les identifiants et connecte l'utilisateur
    func login() {

        if let userFound = users.first(where: {
            $0.mail.lowercased() == mail.lowercased() &&
            $0.password == password
        }) {
            session.currentUser = userFound
            session.welcome = session.homePhrases.randomElement() ?? ":)"
            isConnected = true
        } else {
            showAlert = true
        }
    }
}

#Preview {
    ConnexionView().environment(Session(currentUser: users[0])).environment(HobbyViewModel()).environment(ConversationStore())
}
