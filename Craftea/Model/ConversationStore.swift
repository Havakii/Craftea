//
//  ConversationStore.swift
//  Craftea
//
//  Created by Hava Bakrieva on 03/11/2025.
//

import Foundation
import Observation

@Observable
class ConversationStore {
    var conversations: [Conversation] = mockConversations
    
    func getOrCreateConversation(currentUser: User, otherUser: User, theme: String = "Nouveau contact") -> Conversation {
        if let existing = conversations.first(where: {
            Set($0.participants.map(\.id)) == Set([currentUser.id, otherUser.id])
        }) {
            return existing
        } else {
            let newConversation = Conversation(
                participants: [currentUser, otherUser],
                messages: [
                ],
                theme: theme
            )
            conversations.append(newConversation)
            return newConversation
        }
    }
}
