//
//  MessageMockData.swift
//  Craftea
//
//  Created by Hava Bakrieva on 28/10/2025.
//
import Foundation


let mockUser1 = User(name: "Bastien42", surname: "Smith", mail: "bastien@mail.com", pseudo: "bastien", password: "pass", score: 4.5)
let mockUser2 = User(name: "Bob", surname: "Johnson", mail: "bob@mail.com", pseudo: "bobby", password: "pass", score: 4.0)
let mockUser3 = User(name: "Clara", surname: "Dupont", mail: "clara@mail.com", pseudo: "claraD", password: "pass", score: 4.8)
let mockUser4 = User(name: "David", surname: "Martin", mail: "david@mail.com", pseudo: "davidM", password: "pass", score: 3.9)


let mockMessages1 = [
    Message(sender: mockUser1, receiver: mockUser2, theme: "Pelotes de laine", content: "Bonjour, je suis intéressée par votre article.", timestamp: Date()),
    Message(sender: mockUser2, receiver: mockUser1, theme: "Pelotes de laine", content: "Je peux vous le réserver.", timestamp: Date().addingTimeInterval(60)),
    Message(sender: mockUser1, receiver: mockUser2, theme: "Pelotes de laine", content: "Super, merci !", timestamp: Date().addingTimeInterval(120))
]


let mockMessages2 = [
    Message(sender: mockUser3, receiver: mockUser1, theme: "Tricot", content: "Salut Bastien, ton kit est encore disponible ?", timestamp: Date()),
    Message(sender: mockUser1, receiver: mockUser3, theme: "Tricot", content: "Oui Clara, je peux te le garder.", timestamp: Date().addingTimeInterval(60))
]


let mockMessages3 = [
    Message(sender: mockUser4, receiver: mockUser2, theme: "Bricolage", content: "Bonjour Bob, j’aimerais emprunter votre perceuse.", timestamp: Date()),
    Message(sender: mockUser2, receiver: mockUser4, theme: "Bricolage", content: "Pas de problème, je vous la prête ce week-end.", timestamp: Date().addingTimeInterval(90))
]


let mockConversation1 = Conversation(participants: [mockUser1, mockUser2], messages: mockMessages1)
let mockConversation2 = Conversation(participants: [mockUser1, mockUser3], messages: mockMessages2)
let mockConversation3 = Conversation(participants: [mockUser2, mockUser4], messages: mockMessages3)


let mockConversations = [mockConversation1, mockConversation2, mockConversation3]

