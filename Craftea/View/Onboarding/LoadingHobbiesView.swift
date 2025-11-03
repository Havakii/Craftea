//
//  LoadingHobbiesView.swift
//  Craftea
//
//  Created by Apprenant 83 on 29/10/2025.
//

import SwiftUI

struct LoadingHobbiesView: View {
    @Environment(User.self) var user
    @State private var isLoading = false
    @State private var navigate = false // To trigger NavigationLink programmatically

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 224 / 255, green: 182 / 255, blue: 252 / 255),
                        Color(red: 156 / 255, green: 123 / 255, blue: 245 / 255)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 40) {
                    Text("Merci pour tes réponses ! Nous te préparons des loisirs adaptés !")
                        .font(.custom("Manrope-Bold", size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // Hidden navigation link triggered programmatically
                    NavigationLink(destination: DecouvrirView().environment(users[0]).environment(HobbyViewModel()).environment(welcomeSentence()), isActive: $navigate) {
                        EmptyView()
                    } .toolbar(.hidden, for: .tabBar)

                    Circle()
                        .trim(from: 0, to: 0.2)
                        .stroke(Color("secondaryOrange"), lineWidth: 7)
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                        .animation(
                            Animation.linear(duration: 1)
                                .repeatForever(autoreverses: false),
                            value: isLoading
                        )
                }
                .onAppear {
                    isLoading = true

                    // Automatically navigate after a short delay (e.g., 2.5 seconds)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        navigate = true
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingHobbiesView()
        .environment(users[0])
}

