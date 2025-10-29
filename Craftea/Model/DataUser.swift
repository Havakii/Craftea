//
//  DataUser.swift
//  Craftea
//
//  Created by Andréa  on 28/10/2025.
//

import Foundation

var otherUser: [User] = [
    User(name: "Ethan",surname: "Dufresne",mail: "Ethan@gmail.com",pseudo: "Ethan",password: "123456",favoritesHobby: hobbiesUser),
    User(name:"Pauline",surname: "Lefèvre",mail: "Pauline@gmail.com",pseudo: "Pauline",password: "123456",favoritesHobby: hobbiesUser)]

var hobbiesUser: [Hobby] = [
    Hobby(name: .Crochet, description: "Créer vêtements et accessoires en maille", image: "", level: .medium, category: .textile, equipementNeeded: [],technicalBasis: []),
    Hobby(name: .PeintureAcrylique , description: "Peindre des natures mortes",image: "",level: .medium, category: .peinture, equipementNeeded: [],technicalBasis: [])
]
