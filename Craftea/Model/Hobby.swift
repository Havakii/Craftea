//
//  Hobby.swift
//  Craftea
//
//  Created by apprenant75 on 27/10/2025.
//

import Foundation


struct Hobby: Identifiable {
    let id = UUID()
    var name: HobbyName
    var description: String
    var image: String
    var level: Level
    var category: Category
    var equipementNeeded: [BaseEquipment]
    var technicalBasis: [Technique]
}

enum HobbyName: String, CaseIterable {
    case crochet = "Crochet"
    case peintureAcrylique = "Peinture acrylique" //besoin de data pour Profil 
}

enum Level : String, CaseIterable {
    case easy = "Facile"
    case medium = "Moyen"
    case hard = "Difficile"
}

enum Category : String, CaseIterable {
    case textile = "Textile"
    case peinture = "Peinture" //faute orthographe corriger
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
    let id = UUID()
    var name: String
    var description: String
    var image: String
}

struct Technique: Identifiable {
    let id = UUID()
    var name: String
    var description: String?
    var image: String?
}
