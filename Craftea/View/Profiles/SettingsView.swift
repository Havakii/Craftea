//
//  SettingsView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

struct SettingsView: View {
    @Environment(User.self) private var user
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
            // background
            Color.background.ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]),
                           startPoint: .topLeading, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Button {
                            // Action validation
                        } label: {
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Circle().fill(Color.primaryPurpule))
                        }
                    }
                    .padding(.trailing)
                    
                    // Image de profil
                    ZStack {
                        Circle()
                            .fill(Color.primaryPurpule.opacity(0.2))
                            .frame(width: 200, height: 200)
                        VStack(spacing: 8) {
                            if let image = image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .clipShape(Circle())
                                    .contentShape(Circle())
                            } else {
                                Image(systemName: "plus.rectangle.on.rectangle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.primaryPurpule)
                                Text("Ajouter une image")
                                    .tertiaryTitle()
                                    .foregroundColor(.primaryPurpule)
                            }
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
                    .padding(.bottom, 10)
                    
                    // Textfield setting
                    Group {
                        settingsField(title: "Nom", placeholder: user.surname, text: $nom)
                        settingsField(title: "Prénom", placeholder: user.name, text: $name)
                        settingsField(title: "Pseudo", placeholder: user.pseudo, text: $pseudo)
                        settingsField(title: "Email", placeholder: user.mail, text: $mail)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Mot de passe")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            HStack {
                                if isPasswordVisible {
                                    TextField(user.password, text: $password)
                                } else {
                                    SecureField(user.password, text: $password)
                                }
                                Button(action: {
                                    withAnimation { isPasswordVisible.toggle() }
                                }) {
                                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(12)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3))
                            )
                        }
                    }
                    
                    // Bouton déconnexion
                    HStack {
                        Spacer()
                        Button {
                            // Action déconnexion
                        } label: {
                            Image(systemName: "power")
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Circle().fill(Color.red))
                                .shadow(radius: 2)
                        }
                        .padding(.top, 10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            }
        }
    }
    
private func settingsField(title: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TextField(placeholder, text: text)
                .padding(12)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3))
                )
        }
    }
}

#Preview {
    SettingsView().environment(users[0])
}
