//
//  ContentView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Découvrir", systemImage: "sparkles") {
                DecouvrirView(user: users[0])
            }
            Tab("Materiel", systemImage: "pencil.and.ruler.fill") {
                //MaterielView()
            }
            Tab("Discutions", systemImage: "bubble.left.and.text.bubble.right.fill") {
                MessageView()
            }
            Tab("Profil", systemImage: "person") {
                ProfilView()
            }
        }.tint(Color.primaryPurpule)
    }
}

#Preview {
    ContentView()
}
