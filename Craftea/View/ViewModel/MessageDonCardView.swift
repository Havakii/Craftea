//
//  MessageDonCard.swift
//  Craftea
//
//  Created by Hava Bakrieva on 30/10/2025.
//

import SwiftUI

struct MessageDonCardView: View {
    @Binding var isReserved: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.almostWhite)
                .shadow(color:.gray.opacity(0.2), radius:4, x:0, y:2)
                .frame(width: 370, height: 100)
            HStack {
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .overlay(
                        Rectangle().stroke(Color.gray, lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 2)
                    .padding(.leading)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Don pelotes")
                            .font(.default)
                            .fontWeight(Font.Weight.bold)
                      
                        Spacer()
                        
                    }
                    
                    ZStack {
                        
                        Text("Tag")
                            .foregroundStyle(.primaryPurpule)
                            .font(.system(size: 16, weight: .semibold))
                            .textCase(.uppercase)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.primaryPurpule.opacity(0.03))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.primaryPurpule, lineWidth: 4)
                                            .blur(radius: 4)
                                            .offset(x: 2, y: 2)
                                            .mask(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .fill(
                                                        LinearGradient(
                                                            gradient: Gradient(colors: [.gray.opacity(0.25), .gray.opacity(0.2)]),
                                                            startPoint: .topLeading,
                                                            endPoint: .bottomTrailing
                                                        )
                                                    )
                                            )
                                    )
                                
                            )
                        
                    }
                }.padding(8)
                ButtonComponent(
                            text: isReserved ? "Réservé" : "Réserver",
                            style: isReserved ? .filled : .outlined,
                            size: .small,
                        ) {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isReserved.toggle()
                            }
                        }
                        .padding()
            }.padding(7)
                .frame(width: 380)
            
            
        }
    }
}

#Preview {
        MessageDonCardView(isReserved: .constant(false))
}
