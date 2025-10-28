//
//  ConnexionView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

struct ConnexionView: View {
    @State private var mail: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                VStack {
                    Image("CrafteaLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    Text("C'EST COOL DE TE REVOIR !")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                }
                
                VStack(spacing: 20) {
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
                    }
                    .padding(10)
                    .overlay(
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5))
                    )
                }
                
                    HStack(spacing: 10) {
                        Text("Mot de passe oublié ?")
                        .underline()
                    }  .padding(.leading, 200)
                
                
                Button(action: {
                    print("Inscription effectuée")
                }) {
                    HStack{
                            Text("Me connecter")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.up.right")
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                    }   .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.purple)
                        .cornerRadius(10)
                        


                }
                Spacer()
                            
                HStack(spacing: 5) {
                    Text("Tu n'as pas de compte compte?")
                    Button("S'inscrire") {
                        print("Navigation vers la connexion")
                    }
                }
            }.padding(.bottom, 40)
        }   .padding()
    }
}

#Preview {
    ConnexionView()
}
