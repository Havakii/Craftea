//
//  InscriptionView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

let users2Data = [
    User(name: "Lora-Line", surname: "Faure", mail: "Lora-Line@gmail.com", pseudo: "Lora-Line", password: "123456")
]

struct InscriptionView: View {
    @State var users: [User] = users2Data
    @State private var nom: String = ""
    @State private var name: String = ""
    @State private var pseudo: String = ""
    @State private var mail: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isPassword2Visible: Bool = false
    @State private var showMessage: Bool = false
    
    
    func isPasswordValid() -> Bool {
            return password.count >= 6 && password.count <= 15
        }
    
    func isPassword2Valid() -> Bool {
            return password.count >= 6 && password.count <= 15
        }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    VStack {
                        Image("CrafteaLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Text("BiENVENUE !")
                            .font(.custom("Manrope-Bold", size: 36))
                            .fontWeight(.bold)
                            .padding(.bottom, 20)
                    }
                    
                    VStack(spacing: 20) {
                        TextField("Nom", text: $nom)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                        
                        TextField("Prénom", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                        
                        TextField("Pseudo", text: $pseudo)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                        
                        TextField("Mail", text: $mail)
                            .keyboardType(.emailAddress)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                        
                        // Mot de passe
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
                        }.padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            ).background(Color.white)
                        
                        
                        if !isPasswordValid() && !password.isEmpty {
                            Text("⚠️ Le mot de passe doit contenir entre 6 et 15 caractères.")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.red)
                                .padding(.horizontal, 20)
                        }
                        
                        // Confirmation du mot de passe
                        HStack {
                            if isPassword2Visible {
                                TextField("Confirmez le mot de passe", text: $password2)
                            } else {
                                SecureField("Confirmez le mot de passe", text: $password2)
                            }
                            Button(action: {
                                withAnimation { isPassword2Visible.toggle() }
                            }) {
                                Image(systemName: isPassword2Visible ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }.padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            ).background(Color.white)
                        
                        
                        if !isPassword2Valid() && !password2.isEmpty {
                            Text("⚠️ Le mot de passe doit contenir entre 6 et 15 caractères.")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.red)
                                .padding(.horizontal, 20)
                        }
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "square")
                            .foregroundColor(.purple)
                        Text("J'ai lu et j'accepte les conditions d'utilisation")
                            .font(.custom("Inter_24pt-Regular", size: 15))
                            .underline()
                    }
                    
                    
                    Button(action: {
                        showMessage = true
                    }) {
                        HStack{
                            Image(systemName: "checkmark.circle")
                                .fontWeight(.bold)
                            NavigationLink(destination:QuestionsView()){
                                Text("Valider l'inscription")
                                    .font(.custom("Manrope-Bold", size: 20))
                            }   
                            
                        } .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color("primaryPurpule"))
                            .cornerRadius(10)
                    }
                    
                    HStack(spacing: 5) {
                        Text("Tu as déjà un compte?")
                            .font(.custom("Inter_24pt-Regular", size: 15))
                        
                        NavigationLink(destination: ConnexionView()) {
                            Text("Se connecter")
                                .font(.custom("Manrope-Bold", size: 15))

                        }
                    }

                }.padding()
            }
        }
    }
}

#Preview {
    InscriptionView().environment(users[0])
}
