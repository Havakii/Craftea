//
//  Equipment.swift
//  Craftea
//
//  Created by apprenant75 on 27/10/2025.
//

import Foundation


struct Equipment: Identifiable {
    let id: UUID
    var name: String
    var description: String
    var image: String
    var type: EquipmentType?
    var price: Double?
    var location: String?
    var seller: User?
    var category: EquipmentCategory?
}

enum EquipmentCategory: String, CaseIterable {
    case don = "Don"
    case pret = "Prêt"
    case echange = "Échange"
}

enum EquipmentType: String, CaseIterable {
    case occasion = "Occasion"
    case neuf = "Neuf"
}
