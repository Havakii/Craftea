//
//  Hobby.swift
//  Craftea
//
//  Created by apprenant75 on 27/10/2025.
//

import Foundation


struct Hobbies: Identifiable {
    let id: UUID
    var name: hobbyName
    var description: String
    var image: String
    var level: level
    var category: category
    var equipementNeeded: [BaseEquipment]
    var technicalBasis: [Technique]
}

enum hobbyName: String, CaseIterable {
    case crochet = "Crochet"
}

enum level : String, CaseIterable {
    case easy = "Facile"
    case medium = "Moyen"
    case hard = "Difficile"
}

enum category : String, CaseIterable {
    case textile = "Textile"
    case penture = "Peinture"
    case dessin = "Dessin"
    case modelage = "Modelage"
    case diy = "DIY"
    case papeterie = "Papeterie"
    case papier = "Papier"
    case accessoires = "Accessoires"
    case numérique = "Numérique"
    case écriture = "Écriture"   
}

struct BaseEquipment: Identifiable {
    let id: UUID
    var name: String
    var description: String
    var image: String
}

struct Technique: Identifiable {
    let id: UUID
    var name: String
    var description: String?
    var image: String?
}
