//
//  Message.swift
//  Craftea
//
//  Created by Hava Bakrieva on 28/10/2025.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let sender: User
    let receiver: User
    let theme: String
    let content: String
    let timestamp: Date
}

struct Conversation: Identifiable {
    let id = UUID()
    let participants: [User]
    var messages: [Message]
}
