//
//  HobbyViewModel.swift
//  Craftea
//
//  Created by chatGPT on 28/10/2025.
//


import SwiftUI
import UIKit

extension UIImage {
    /// Sauvegarde l'image dans le dossier Documents avec un nom donné
    func saveToDocuments(named name: String) -> URL? {
        guard let data = self.pngData() else { return nil }
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(name).png")
        do {
            try data.write(to: fileURL)
            return fileURL
        } catch {
            print("Erreur sauvegarde image:", error.localizedDescription)
            return nil
        }
    }
    
    /// Charge une image depuis le dossier Documents par nom
    static func loadFromDocuments(named name: String) -> UIImage? {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(name).png")
        return UIImage(contentsOfFile: fileURL.path)
    }
}

@Observable
class HobbyViewModel {
    private let unsplash = UnsplashService(accessKey: "5bOGmrInQ06GBsAQMMD4OE8hN9S0J9QU9Y_ShBlgE6U")
    
    var hobbies: [Hobby] = []
    //var searchobjectController = SearchobjectController()
    
    init() {
        hobbies = [   //La liste de tout nos hobbies
            
             Hobby(
             name: .PeintureAcrylique,
             description: "Créer des œuvres colorées et texturées",
             image: "",
             level: .easy,
             category: .peinture,
             equipementNeeded: [
             BaseEquipment(name: "Pinceaux", description: "Ensemble de pinceaux plats et ronds", image: ""),
             BaseEquipment(name: "Toile", description: "Toile montée ou panneau entoilé", image: ""),
             BaseEquipment(name: "Palette", description: "Pour mélanger les couleurs", image: "")
             ],
             technicalBasis: [
             Technique(name: "Aplat", description: "Couche uniforme de couleur", image: nil),
             Technique(name: "Empâtement", description: "Appliquer la peinture en relief", image: nil)
             ]
             ),
             Hobby(
             name: .Aquarelle,
             description: "Peindre avec légèreté et transparence",
             image: "",
             level: .medium,
             category: .peinture,
             equipementNeeded: [
             BaseEquipment(name: "Papiers aquarelle", description: "Papier 300 g/m²", image: ""),
             BaseEquipment(name: "Pinceaux à lavis", description: "Pinceaux souples pour lavis", image: "")
             ],
             technicalBasis: [
             Technique(name: "Lavis", description: "Peinture très diluée", image: nil),
             Technique(name: "Dégradé", description: "Fondu de couleurs", image: nil)
             ]
             ),/* //ils sont commenté pour pas surchercher l'api de requettes (limite 50par heure (c'est pour ca que je veux telecharger les iamges en local ))
             Hobby(
             name: .Dessin,
             description: "Explorer le trait et les ombres",
             image: "",
             level: .easy,
             category: .dessin,
             equipementNeeded: [
             BaseEquipment(name: "Crayons graphite", description: "Différentes duretés (HB, 2B, 4B)", image: ""),
             BaseEquipment(name: "Fusain", description: "Pour ombrages profonds", image: "")
             ],
             technicalBasis: [
             Technique(name: "Hachures", description: "Technique pour ombrer", image: nil),
             Technique(name: "Contour", description: "Tracer le contour et proportions", image: nil)
             ]
             ),
             Hobby(
             name: .PeintureGalet,
             description: "Décorer des pierres uniques et naturelles",
             image: "",
             level: .easy,
             category: .peinture,
             equipementNeeded: [
             BaseEquipment(name: "Galets", description: "Pierres lisses lavées", image: ""),
             BaseEquipment(name: "Peinture acrylique", description: "Peinture pour surfaces", image: "")
             ],
             technicalBasis: [
             Technique(name: "Mini motifs", description: "Peintures petites échelles", image: nil)
             ]
             ),
             Hobby(
             name: .Broderie,
             description: "Décorer le tissu avec des fils colorés",
                image: "",
             level: .medium,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Aiguilles à broder", description: "Aiguilles adaptées", image: ""),
             BaseEquipment(name: "Tambour à broder", description: "Maintient le tissu tendu", image: "")
             ],
             technicalBasis: [
             Technique(name: "Point de tige", description: "Point décoratif simple", image: nil),
             Technique(name: "Point de croix", description: "Motifs en x", image: nil)
             ]
             ),
             Hobby(
             name: .Crochet,
             description: "Créer vêtements et accessoires en maille",
                image: "",
             level: .medium,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Crochet", description: "Crochet adapté à la laine", image: ""),
             BaseEquipment(name: "Laine", description: "Fil adapté (catégorie 4 recommandé)", image: "")
             ],
             technicalBasis: [
             Technique(name: "Maille serrée", description: "Point de base", image: nil),
             Technique(name: "Bride", description: "Point plus haut", image: nil)
             ]
             ),
             Hobby(
             name: .Couture,
             description: "Fabriquer ou réparer ses propres vêtements",
                image: "",
             level: .hard,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Machine à coudre", description: "Machine pour coudre rapidement", image: ""),
             BaseEquipment(name: "Tissus", description: "Tissus variés", image: "")
             ],
             technicalBasis: [
             Technique(name: "Assemblage", description: "Couture des pièces ensemble", image: nil),
             Technique(name: "Finitions", description: "Ourlets, surpiqûres", image: nil)
             ]
             ),
             Hobby(
             name: .Poterie,
             description: "Façonner objets décoratifs à la main",
                image: "",
             level: .medium,
             category: .modelage,
             equipementNeeded: [
             BaseEquipment(name: "Argile", description: "Pâte à modeler", image: ""),
             BaseEquipment(name: "Tour ou outils de modelage", description: "Outils pour former", image: "")
             ],
             technicalBasis: [
             Technique(name: "Modelage main", description: "Façonner sans tour", image: nil),
             Technique(name: "Cuisson", description: "Cuire l'argile au four", image: nil)
             ]
             ),
             Hobby(
             name: .Bougies,
             description: "Créer des bougies parfumées personnalisées",
                image: "",
             level: .easy,
             category: .diy,
             equipementNeeded: [
             BaseEquipment(name: "Cire", description: "Cire paraffine ou soja", image: ""),
             BaseEquipment(name: "Mèches", description: "Mèches adaptées", image: "")
             ],
             technicalBasis: [
             Technique(name: "Fusion", description: "Faire fondre la cire", image: nil)
             ]
             ),
             Hobby(
             name: .Savons,
             description: "Fabriquer des savons naturels et uniques",
                image: "",
             level: .medium,
             category: .diy,
             equipementNeeded: [
             BaseEquipment(name: "Bases de savon", description: "Base melt & pour ou saponification", image: ""),
             BaseEquipment(name: "Moules", description: "Moules silicone", image: "")
             ],
             technicalBasis: [
             Technique(name: "Saponification", description: "Transformation des corps gras", image: nil)
             ]
             ),
             Hobby(
             name: .Scrapbooking,
             description: "Mettre en scène ses souvenirs créatifs",
                image: "",
             level: .easy,
             category: .papeterie,
             equipementNeeded: [
             BaseEquipment(name: "Papiers décoratifs", description: "Feuilles imprimées", image: ""),
             BaseEquipment(name: "Ciseaux et colle", description: "Outils de découpe et collage", image: "")
             ],
             technicalBasis: [
             Technique(name: "Mise en page", description: "Composer la page", image: nil)
             ]
             ),
             Hobby(
             name: .Origami,
             description: "Plier le papier pour créer des formes",
                image: "",
             level: .easy,
             category: .papier,
             equipementNeeded: [
             BaseEquipment(name: "Papier origami", description: "Feuilles prédécoupées", image: "")
             ],
             technicalBasis: [
             Technique(name: "Pliage de base", description: "Valley fold, mountain fold", image: nil)
             ]
             ),
             Hobby(
             name: .Bijoux,
             description: "Assembler perles et matériaux pour s’exprimer",
                image: "",
             level: .medium,
             category: .accessoires,
             equipementNeeded: [
             BaseEquipment(name: "Perles", description: "Perles de différentes tailles", image: ""),
             BaseEquipment(name: "Fil et outils", description: "Fil, pinces, fermoirs", image: "")
             ],
             technicalBasis: [
             Technique(name: "Montage", description: "Assembler éléments", image: nil)
             ]
             ),
             Hobby(
             name: .Macrame,
             description: "Tisser des nœuds pour objets décoratifs",
                image: "",
             level: .easy,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Corde", description: "Corde coton ou jute", image: ""),
             BaseEquipment(name: "Support", description: "Bâton ou anneau pour suspendre", image: "")
             ],
             technicalBasis: [
             Technique(name: "Nœuds de base", description: "Noeud plat, demi-noeud", image: nil)
             ]
             ),
             Hobby(
             name: .DessinNumerique,
             description: "Créer des œuvres sur tablette ou PC",
                image: "",
             level: .medium,
             category: .numerique,
             equipementNeeded: [
             BaseEquipment(name: "Tablette graphique", description: "Tablette + stylet", image: ""),
             BaseEquipment(name: "Logiciel de dessin", description: "Procreate, Photoshop, etc.", image: "")
             ],
             technicalBasis: [
             Technique(name: "Calques", description: "Organisation des éléments", image: nil)
             ]
             ),
             Hobby(
             name: .Modelisation3D,
             description: "Concevoir et façonner des objets virtuels",
                image: "",
             level: .hard,
             category: .numerique,
             equipementNeeded: [
             BaseEquipment(name: "Logiciel 3D", description: "Blender, Maya, etc.", image: ""),
             BaseEquipment(name: "Ordinateur puissant", description: "GPU/CPU adapté", image: "")
             ],
             technicalBasis: [
             Technique(name: "Modélisation", description: "Mesh modelling, sculpt", image: nil)
             ]
             ),
             Hobby(
             name: .Photomontage,
             description: "Transformer ou sublimer des images existantes",
                image: "",
             level: .medium,
             category: .numerique,
             equipementNeeded: [
             BaseEquipment(name: "Appareil photo / smartphone", description: "Pour prendre photos", image: ""),
             BaseEquipment(name: "Logiciel de retouche", description: "Photoshop, Affinity", image: "")
             ],
             technicalBasis: [
             Technique(name: "Masques et calques", description: "Assembler images", image: nil)
             ]
             ),
             Hobby(
             name: .EcritureCreative,
             description: "Inventer des histoires et jouer avec les mots",
                image: "",
             level: .easy,
             category: .ecriture,
             equipementNeeded: [
             BaseEquipment(name: "Cahier", description: "Carnet pour notes", image: ""),
             BaseEquipment(name: "Stylo", description: "Stylo confortable", image: "")
             ],
             technicalBasis: [
             Technique(name: "Structure narrative", description: "Début, milieu, fin", image: nil)
             ]
             ),
             Hobby(
             name: .Calligraphie,
             description: "Dessiner de belles lettres décoratives",
                image: "",
             level: .medium,
             category: .ecriture,
             equipementNeeded: [
             BaseEquipment(name: "Plumes / feutres", description: "Outils pour lettering", image: ""),
             BaseEquipment(name: "Papier lisse", description: "Papier adapté", image: "")
             ],
             technicalBasis: [
             Technique(name: "Contrôle du trait", description: "Pression et inclinaison", image: nil)
             ]
             ),
             Hobby(
             name: .JournalCreatif,
             description: "Organiser ses idées avec créativité visuelle",
                image: "",
             level: .easy,
             category: .papeterie,
             equipementNeeded: [
             BaseEquipment(name: "Bullet journal", description: "Carnet à point", image: ""),
             BaseEquipment(name: "Stickers et feutres", description: "Décorations", image: "")
             ],
             technicalBasis: [
             Technique(name: "Layouts", description: "Mise en page fonctionnelle", image: nil)
             ]
             )*/
        ]
        
        Task {
            await loadHobbyCoverImages() // a supprimer si on telecharge les images de hobby nous meme
        }
    }
    
    func loadHobbyCoverImages() async {
        await withTaskGroup(of: Void.self) { group in
            for hobbyIndex in hobbies.indices {
                group.addTask(priority: .medium) { [weak self] in
                    guard let self = self else { return }
                    
                    let hobbyName = await self.hobbies[hobbyIndex].name.rawValue
                    let hobby = await self.hobbies[hobbyIndex]
                    
                    if hobby.image.isEmpty {
                        if let url = await self.unsplash.fetchImageURL(for: hobbyName) {
                            await MainActor.run {
                                self.hobbies[hobbyIndex].image = url
                            }
                        }
                    }
                }
            }
        }
    }
    func loadDetailImages(for: Hobby) async {
        /*.onAppear {  // a utiliser au dans la page ou on veut afficher les images
         Task {
         await viewModel.loadDetailImages(for: hobby)
         }
         }*/
        await withTaskGroup(of: Void.self) { group in
            for hobbyIndex in hobbies.indices {
                group.addTask(priority: .medium) { [weak self] in
                    guard let self = self else { return }
                    
                    let hobbyName = await self.hobbies[hobbyIndex].name.rawValue
                    let hobby = await self.hobbies[hobbyIndex]
                    
                    
                    // Images des équipements
                    for eqIndex in hobby.equipementNeeded.indices {
                        if hobby.equipementNeeded[eqIndex].image.isEmpty {
                            let eqName = hobby.equipementNeeded[eqIndex].name
                            let query = "\(eqName) \(hobbyName)"
                            let firstAttempt = await self.unsplash.fetchImageURL(for: query)
                            let secondAttempt = await self.unsplash.fetchImageURL(for: eqName)
                            if let url = firstAttempt ?? secondAttempt {
                                await MainActor.run {
                                    self.hobbies[hobbyIndex].equipementNeeded[eqIndex].image = url
                                }
                            }
                        }
                    }
                    
                    // Images des techniques
                    for tIndex in hobby.technicalBasis.indices {
                        let tech = hobby.technicalBasis[tIndex]
                        if tech.image?.isEmpty == true {
                            let query = "\(tech.name) \(hobbyName)"
                            let firstAttempt = await self.unsplash.fetchImageURL(for: query)
                            let secondAttempt = await self.unsplash.fetchImageURL(for: tech.name)
                            if let url = firstAttempt ?? secondAttempt {
                                await MainActor.run {
                                    self.hobbies[hobbyIndex].technicalBasis[tIndex].image = url
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

