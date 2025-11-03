//
//  Equipment.swift
//  Craftea
//
//  Created by apprenant75 on 27/10/2025.
//

import Foundation


enum EquipmentCategory: String, CaseIterable {
    case don = "Don"
    case pret = "Prêt"
    case echange = "Échange"
}

struct Materiel: Identifiable {
    let id = UUID()
    let nom: String
    var image: String
    let description: String
    let vendeur: User
    let typeMateriel: EquipmentCategory
}

struct MaterielPro: Identifiable {
    let id = UUID()
    let nom: String
    var image: String
    let description: String
    let vendeur: String
    let prix: String
}


private let unsplash = UnsplashService(accessKey: "5bOGmrInQ06GBsAQMMD4OE8hN9S0J9QU9Y_ShBlgE6U")
func loadCoverImages() async {
    for i in materielsOccasion.indices {
        
        let materielName = materielsOccasion[i].nom
        let materiel = materielsOccasion[i]
        
        if materiel.image.isEmpty {
            if let url =  await unsplash.fetchImageURL(for: materielName) {
                await MainActor.run {
                    materielsOccasion[i].image = url
                }
            }
        }
    }
}
func loadCoverImagesPro() async {
    for i in materielsNeuf.indices {
        
        let materielName = materielsNeuf[i].nom
        let materiel = materielsNeuf[i]
        
        if materiel.image.isEmpty {
            if let url =  await unsplash.fetchImageURL(for: materielName) {
                await MainActor.run {
                    materielsNeuf[i].image = url
                }
            }
        }
    }
}
     
