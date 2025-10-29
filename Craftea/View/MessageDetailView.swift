//
//  MessageDetailView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

public struct MessageDetailView: View {
    var conversation: Conversation

    public var body: some View {
        VStack {
            ScrollView {
                ForEach(conversation.messages) { message in
                    HStack {
                        if message.sender.name == conversation.participants.first?.name {
                            Spacer()
                            Text(message.content)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                        } else {
                            Text(message.content)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                }
            }
            Spacer()
        }
        .navigationTitle("Conversation")
    }
}

#Preview {
    MessageDetailView(conversation: mockConversations[0])
}


