//
//  User.swift
//  Craftea
//
//  Created by apprenant75 on 27/10/2025.
//

import Foundation
import Observation

@Observable
class User: Identifiable {
    let id = UUID()
    var name: String
    var surname: String
    var mail: String
    var pseudo: String
    var password: String
    var location: String?
    var score: Double
    var favoriteEquipment: [Materiel]
    var favoriteEquipmentPro : [MaterielPro]
    var favoritesHobby: [Hobby]
    var equipment: [Materiel?]
    var recommandations: [Hobby]
    
    init(name: String, surname: String, mail: String, pseudo: String, password: String, location: String? = nil, score: Double = 5, favoriteEquipment: [Materiel] = [], favoriteEquipmentPro : [MaterielPro] = [], favoritesHobby: [Hobby] = [], equipment: [Materiel] = [], recommandations: [Hobby] = []) {
        self.name = name
        self.surname = surname
        self.mail = mail
        self.pseudo = pseudo
        self.password = password
        self.location = location
        self.score = score
        self.favoriteEquipment = favoriteEquipment
        self.favoriteEquipmentPro = favoriteEquipmentPro
        self.favoritesHobby = favoritesHobby
        self.equipment = equipment
        self.recommandations = recommandations
    }
}

