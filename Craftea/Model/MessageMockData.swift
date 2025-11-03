//
//  MessageMockData.swift
//  Craftea
//
//  Created by Hava Bakrieva on 28/10/2025.
//



//
//  MessageMockData.swift
//  Craftea
//
//  Created by Hava Bakrieva on 28/10/2025.
//

import Foundation

let ethan = users[0]
let pauline = users[2]
let nathan = users[1]

let ethanPaulineMessages = [
    Message(sender: ethan, receiver: pauline, content: "Salut Pauline ! Tu bosses sur quoi en ce moment ?"),
    Message(sender: pauline, receiver: ethan, content: "Coucou Ethan ! Je teste la broderie, c’est trop relaxant 😌"),
    Message(sender: ethan, receiver: pauline, content: "Ah j’aimerais bien essayer aussi !"),
    Message(sender: pauline, receiver: ethan, content: "Je te montrerai le matériel que j’utilise 👍")
]

let ethanNathanMessages = [
    Message(sender: ethan, receiver: nathan, content: "Yo Nathan, tu viens à l’atelier demain ?"),
    Message(sender: nathan, receiver: ethan, content: "Ouais bien sûr ! J’apporte la peinture 🎨"),
    Message(sender: ethan, receiver: nathan, content: "Parfait, j’ai hâte !")
]

let mockConversations: [Conversation] = [
    Conversation(participants: [ethan, pauline],
                 messages: ethanPaulineMessages,
                 theme: "Don de Pelotes"),
    Conversation(participants: [ethan, nathan],
                 messages: ethanNathanMessages,
                 theme: "Prêt Matériel")
]

