//
//  ConnexionView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

let usersData = [
    User(name: "Lora-Line", surname: "Faure", mail: "Lora-Line@gmail.com", pseudo: "Lora-Line", password: "123456")
]

struct ConnexionView: View {
    @Environment(User.self) var user
    @State private var mail: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isConnected: Bool = false
    @State private var showAlert: Bool = false
    
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
                        
                        Text("C'EST COOL DE TE REVOIR !")
                            .font(.custom("Manrope-Bold", size: 36))
                            .fontWeight(.bold)
                            .padding(.bottom, 20)
                    }
                    
                    
                    VStack(spacing: 20) {
                        TextField("Mail", text: $mail)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                        
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
                    
                  
                    HStack {
                        Spacer()
                        Text("Mot de passe oublié ?")
                            .font(.custom("Inter_24pt-Regular", size: 15))
                            .underline()
                    }
                    
                    
                    Button(action: {
                        if let _ = usersData.first(where: {
                            $0.mail.lowercased() == mail.lowercased() && $0.password == password
                        }) {
                           
                            isConnected = true
                        } else {
                            
                            showAlert = true
                        }
                    }) {
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
                    
                    // Navigation après connexion réussie
                    NavigationLink(destination: DecouvrirView().environment(users[0]), isActive: $isConnected) {
                        EmptyView()
                    }
                    
                    Spacer()
                    
                   
                    HStack {
                        Text("Tu n'as pas de compte ?")
                            .font(.custom("Inter_24pt-Regular", size: 15))
                        NavigationLink(destination: InscriptionView()) {
                            Text("S'inscrire")
                                .font(.custom("Manrope-Bold", size: 15))
                        }
                    }
                    
                }.padding()
            }
        }
    }
}

#Preview {
    ConnexionView()
        .environment(users[0])
}

