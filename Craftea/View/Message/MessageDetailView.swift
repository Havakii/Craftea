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
    @State private var showSecurityMessage = true
    @State private var isReserved = false
    
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
                MessageDonCardView(isReserved: $isReserved)
                
                
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
                    if isReserved {
                        Text("Le produit est réservé.")
                            .font(.subheadline)
                            .foregroundColor(.primaryPurpule)
                            .padding()
                    }
                    if showSecurityMessage {
                        HStack(alignment: .top) {
                            Text("⚠️️ Pour votre sécurité, ne partagez pas d’adresse exacte ni d’informations personnelles. Privilégiez les lieux publics pour vos échanges.")
                                .font(.footnote)
                                .padding(7)
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    showSecurityMessage = false
                                }
                            }) {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(.gray)
                                    .padding(.vertical, 8)
                            }
                            .padding(.trailing, 4)
                        }
                    }
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
                        Button(action: {
                            sendMessage()
                            withAnimation {
                                showSecurityMessage = false
                            }
                        }){
                            Text("Envoyer")
                                .foregroundColor(newMessage.isEmpty ? .gray : .primaryPurpule)
                                .padding(.horizontal, 8)
                        }
                    }
                    
                }
                .padding()
            }
            .navigationTitle("Conversation")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button (action: {}) {
                        Image(systemName: "flag.fill")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(Color("primaryPurpule"))
                    }
                    
                }
            }.padding()
        }.toolbar(.hidden, for: .tabBar) 
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


