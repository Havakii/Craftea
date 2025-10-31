//
//  AjoutMaterielView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

struct AjoutMaterielView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var titreAnnonce: String = ""
    @State private var descriptionAnnonce: String = ""
    @State private var lieu: String = ""
    @State private var selectedType: String = ""
    
    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false
    @State private var pickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showingActionSheet = false
    
    let typesAnnonce = ["Don", "Échange", "Prêt"]
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]),
                           startPoint: .topLeading,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.primaryPurpule.opacity(0.2))
                            .frame(width: 250, height: 250)
                        
                        VStack(spacing: 10) {
                            if let image = image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 250, height: 250)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .contentShape(RoundedRectangle(cornerRadius: 15))
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
                    .frame(maxWidth: .infinity)
                    
                    Text("Titre de ton annonce")
                        .tertiaryTitle()
                        .foregroundColor(.black)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(height: 50)
                        
                        TextField("ex : Pinceau-plat", text: $titreAnnonce)
                            .padding(.horizontal, 12)
                            .mainText()
                    }
                    
                    Text("Description")
                        .tertiaryTitle()
                        .foregroundColor(.black)
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(height: 120)
                        
                        if descriptionAnnonce.isEmpty {
                            Text("ex : Utilisé quelques fois, en très bon état")
                                .foregroundColor(.gray.opacity(0.5))
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                        }
                        
                        TextEditor(text: $descriptionAnnonce)
                            .padding(.horizontal, 12)
                            .padding(.top, 8)
                            .frame(height: 120)
                            .scrollContentBackground(.hidden)
                            .font(.system(size: 16))
                    }
                    
                    Text("Type d'annonce")
                        .tertiaryTitle()
                        .foregroundColor(.black)
                    
                    HStack {
                        ForEach(typesAnnonce, id: \.self) { type in
                            Button(action: { selectedType = type }) {
                                HStack {
                                    Circle()
                                        .strokeBorder(Color.primaryPurpule, lineWidth: 2)
                                        .background(
                                            Circle()
                                                .fill(selectedType == type ? Color.primaryPurpule : Color.white)
                                        )
                                        .frame(width: 24, height: 24)
                                    
                                    Text(type)
                                        .mainText()
                                        .foregroundColor(.black)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                    Text("Lieu")
                        .tertiaryTitle()
                        .foregroundColor(.black)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(height: 50)
                        
                        TextField("ex : Paris", text: $lieu)
                            .padding(.horizontal, 12)
                            .mainText()
                    }
                    
                    NavigationLink(destination: MaterielView()) {
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color.white.opacity(0.3))
                                    .frame(width: 20, height: 20)
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10, weight: .bold))
                            }
                            
                            Text("Publier un article")
                                .buttonLabel()
                                .foregroundColor(.white)
                        }
                        .frame(width: 200)
                        .padding()
                        .background(Color.primaryPurpule)
                        .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                    .disabled(titreAnnonce.isEmpty || descriptionAnnonce.isEmpty || lieu.isEmpty || selectedType.isEmpty)
                    .opacity(titreAnnonce.isEmpty || descriptionAnnonce.isEmpty || lieu.isEmpty || selectedType.isEmpty ? 0.5 : 1)
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primaryPurpule)
                            .font(.title3)
                        
                            .navigationBarHidden(true)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NavigationStack {
        AjoutMaterielView()
    }
}

