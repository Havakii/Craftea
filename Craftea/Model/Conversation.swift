//
//  Conversation.swift
//  Craftea
//
//  Created by Hava Bakrieva on 03/11/2025.
//
import Foundation
import Observation

@Observable
class Conversation: Identifiable {
    let id = UUID()
    let participants: [User]
    var messages: [Message]
    var theme: String

    init(participants: [User], messages: [Message] = [], theme: String) {
        self.participants = participants
        self.messages = messages
        self.theme = theme
    }

    func addMessage(_ message: Message) {
        messages.append(message)
    }
}
