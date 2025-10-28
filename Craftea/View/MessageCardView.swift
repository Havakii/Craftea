//
//  MessageCardView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

public struct MessageCardView: View {
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
                .frame(width: 350, height: 100)
            
            HStack {
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.gray, lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 2)
                    .padding(.leading)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name")
                            .font(Font.headline.bold())
                        ZStack {
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("5")
                            }
                            .padding(.horizontal, 8) // optional: give some padding inside the background
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.03))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray, lineWidth: 4)
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
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white)
                                .glassEffect(in: .rect(cornerRadius:8))
                                .frame(width: 50, height: 26)
                            Text("Tag")
                                .font(.caption)
                        }
                        
                    }.padding(.bottom, 7)
                    
                    Text("Subject")
                        .font(Font.subheadline)
                        .fontWeight(Font.Weight.light)
                }.padding(10)
                
            }.padding(5)
            .frame(width: 350)
            
            
        }
    }
}

#Preview {
    MessageCardView()
}
