//
//  MessageCardView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

public struct MessageCardView: View {
    var conversation: Conversation
    public var body: some View {
        if let lastMessage = conversation.messages.last,
           let otherUser = conversation.participants.first {
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
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.gray, lineWidth: 1)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 2)
                        .padding(.leading)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(otherUser.name)
                                .font(Font.headline.bold())
                            ZStack {
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    Text(String(format: "%.1f", otherUser.score))
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.secondaryOrange.opacity(0.03))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.secondaryOrange, lineWidth: 4)
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
                            
                        }
                        
                        Text(lastMessage.theme)
                            .font(Font.headline)
                            .fontWeight(Font.Weight.light)
                            .foregroundStyle(.textSecondary)
                    }.padding(8)
                    
                }.padding(7)
                    .frame(width: 380)
                
                
            }
        }
    }
}

#Preview {
    MessageCardView(conversation: mockConversations[0])
}

