//
//  MessageDetailView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

public struct MessageDetailView: View {
    @State private var newMessage: String = ""
    @State private var conversation: Conversation
    
    init(conversation: Conversation) {
        _conversation = State(initialValue: conversation)
    }
    
    public var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            LinearGradient(
                gradient: Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack {
                        ForEach(conversation.messages) { message in
                            HStack {
                                if message.sender.name == conversation.participants.first?.name {
                                    Spacer()
                                    Text(message.content)
                                        .padding(10)
                                        .background(Color.primaryPurpule.opacity(0.2))
                                        .cornerRadius(10)
                                } else {
                                    Text(message.content)
                                        .padding(10)
                                        .background(Color.secondaryOrange.opacity(0.1))
                                        .cornerRadius(10)
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                        }
                    }
                }
                
                VStack {
                    TextField("Écrire un message...", text: $newMessage, axis: .vertical)
                        .lineLimit(...3)
                        .padding()
                        .background(Color.almostWhite)
                    
                    HStack {
                        Button(action: {
                            //TODO: addMedia button + check
                        }) {
                            Image(systemName: "photo.badge.plus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .padding()
                        }
                        Spacer()
                        Button(action: sendMessage) {
                            Text("Envoyer")
                                .foregroundColor(newMessage.isEmpty ? .gray : .primaryPurpule)
                                .padding(.horizontal, 8)
                        }
                    }
                    
                }
                .padding()
            }
            .navigationTitle("Conversation")
        }
    }
    
    
    private func sendMessage() {
        guard !newMessage.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        guard let sender = conversation.participants.first,
              let receiver = conversation.participants.last else { return }
        
        let newMsg = Message(
            sender: sender,
            receiver: receiver,
            theme: "default",
            content: newMessage,
            timestamp: Date()
        )
        
        conversation.messages.append(newMsg)
        newMessage = ""
    }
}


#Preview {
    MessageDetailView(conversation: mockConversations[0])
}


