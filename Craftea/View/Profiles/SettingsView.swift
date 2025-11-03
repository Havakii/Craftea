//
//  SettingsView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

struct SettingsView: View {
    @State private var nom: String = ""
    @State private var name: String = ""
    @State private var pseudo: String = ""
    @State private var mail: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false
    @State private var pickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showingActionSheet = false
    
    var body: some View {
        ZStack {
            //Background global
            Color.background.ignoresSafeArea()
            LinearGradient(gradient:Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottom).ignoresSafeArea()
            
            // Nom Section
            VStack(spacing: 10) {
                // Validation Changement Profil
                Button {
                        // Action validation
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(Color.primaryPurpule))
                    }
                    .padding(.leading,300)
                
                    ZStack {
                        Circle()
                            .fill(Color.primaryPurpule.opacity(0.2))
                            .frame(width: 250, height: 250)
                        
                        VStack(spacing: 10) {
                            if let image = image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 250, height: 250)
                                    .clipShape(Circle())
                                    .contentShape(Circle())
                            } else {
                                Image(systemName: "plus.rectangle.on.rectangle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.primaryPurpule)
                                Text("Ajouter une image")
                                    .tertiaryTitle()
                                    .foregroundColor(.primaryPurpule)
                            }
                        }
                        .onTapGesture { showingActionSheet = true }
                        .actionSheet(isPresented: $showingActionSheet) {
                            ActionSheet(
                                title: Text("Ajouter une image"),
                                buttons: [
                                    .default(Text("Prendre une photo")) {
                                        pickerSourceType = .camera
                                        showingImagePicker = true
                                    },
                                    .default(Text("Choisir depuis la galerie")) {
                                        pickerSourceType = .photoLibrary
                                        showingImagePicker = true
                                    },
                                    .cancel()
                                ])
                        }
                        .sheet(isPresented: $showingImagePicker) {
                            ImagePicker(image: $image, sourceType: pickerSourceType)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                    }
                    
                    VStack {
                        Text("Nom")
                            .padding(.trailing, 300)
                        TextField("Nom", text: $nom)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            ).background(Color.white)
                    }
                    //Prénom Section
                    VStack {
                        Text("Prénom")
                            .padding(.trailing, 280)
                        TextField("Prénom", text: $name)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            ).background(Color.white)
                    }
                    //Pseudo Section
                    VStack {
                        Text("Pseudo")
                            .padding(.trailing, 280)
                        TextField("Pseudo", text: $pseudo)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            ).background(Color.white)
                    }
                    //Email Section
                    VStack {
                        Text("Email")
                            .padding(.trailing, 300)
                        TextField("Email", text: $mail)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            ).background(Color.white)
                    }
                    // Mot de passe
                    Text("Mot de passe")
                        .padding(.trailing, 230)
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
                    .padding(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5))
                    ).background(Color.white)
                    Spacer()
                    // Bouton déconnexion
                    Button {
                        // Action déconnexion
                    } label: {
                        Image(systemName: "power")
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(Color.red))
                            .shadow(radius: 2)
                    }
                    .padding(.leading,300)
                    .padding(.bottom,30)
                }
                .padding(30)
            }
        }
    }
#Preview {
    SettingsView()
}
