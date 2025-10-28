//
//  ProfilView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

struct ProfilView: View {
    var body: some View {
        VStack {
            Image(systemName:"person.fill")
                .resizable()
                .frame(width: 100)
            Text("username")
                .font(Font.largeTitle.bold())
        }
            .padding()
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .navigationTitle("Mes Loisirs")
            .padding()
        }
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .navigationTitle(Text("Mes Favoris"))
        }
                .padding()
                NavigationStack {
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Hello, world!")
                    }
                    .navigationTitle("Mes articles de Troc")
                }
    }
}
#Preview {
    ProfilView()
}
