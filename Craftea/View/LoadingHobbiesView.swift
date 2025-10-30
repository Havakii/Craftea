//
//  LoadingHobbiesView.swift
//  Craftea
//
//  Created by Apprenant 83 on 29/10/2025.
//

import SwiftUI

struct LoadingHobbiesView: View {
    @State private var isLoading = false
    @State private var navigate = false
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient:Gradient(colors: [Color(red: 224 / 255, green: 182 / 255, blue: 252 / 255), Color(red: 156 / 255, green: 123 / 255, blue: 245 / 255)]), startPoint: .topLeading, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    Text("Merci pour tes réponses ! Nous te préparons des loisirs adaptés ! ")
                        .font(.custom("Manrope-Bold", size: 20))
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: DecouvrirView(user: users[0]), isActive: $navigate) {
                        EmptyView()
                    }

                    Circle()
                        .trim(from: 0, to: 0.2)
                        .stroke(Color("secondaryOrange"), lineWidth: 7)
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                        .onAppear {
                            isLoading = true
                            // Simulate loading delay
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                navigate = true
                            }
                        }

            }
            .onAppear {
             isLoading = true
            }
                  
            }
        }

        }
    }

#Preview {
    LoadingHobbiesView()
}
