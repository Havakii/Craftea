//
//  Data.swift
//  Craftea
//
//  Created by apprenant75 on 27/10/2025.
//

import Foundation

var users: [User] = [
    User(name: "Lora-Line", surname: "Faure", mail: "Lora-Line@gmail.com", pseudo: "Lora-Line", password: "123456")
]

var hobbies: [Hobby] = [
    Hobby(name: .crochet, description: "Créer vêtements et accessoires en maille", image: "", level: .medium, category: .textile, equipementNeeded: [],technicalBasis: []),
    Hobby(name: .PeintureAcrylique, description: "Créer des œuvres colorées et texturées", image: "", level: .easy, category: .penture, equipementNeeded: [],technicalBasis: []),
    Hobby(name: .Modélisation3D, description: "Créer des œuvres sur tablette ou PC", image: "", level: .hard, category: .numérique, equipementNeeded: [], technicalBasis:[])
]
