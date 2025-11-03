//
//  SettingsView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

struct SettingsView: View {
    @Environment(Session.self) private var session
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
                        settingsField(title: "Nom", placeholder: session.currentUser.surname, text: $nom)
                        settingsField(title: "Prénom", placeholder: session.currentUser.name, text: $name)
                        settingsField(title: "Pseudo", placeholder: session.currentUser.pseudo, text: $pseudo)
                        settingsField(title: "Email", placeholder: session.currentUser.mail, text: $mail)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Mot de passe")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            HStack {
                                if isPasswordVisible {
                                    TextField(session.currentUser.password, text: $password)
                                } else {
                                    SecureField(session.currentUser.password, text: $password)
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


                    .padding(.bottom,30)
                }
                .padding(24)
            }.toolbar(.hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: ConnexionView()){Image(systemName: "power")
                    }.buttonStyle(.glassProminent)
                        .tint(.red)
                }
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
    SettingsView().environment(Session(currentUser: users[0]))
}
