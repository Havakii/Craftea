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
        hobbies = [
            /*Hobby(
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
            ),*/
            
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
             ),/*
             Hobby(
             name: .Dessin,
             description: "Explorer le trait et les ombres",
             image: "https://source.unsplash.com/featured/?sketching",
             level: .easy,
             category: .dessin,
             equipementNeeded: [
             BaseEquipment(name: "Crayons graphite", description: "Différentes duretés (HB, 2B, 4B)", image: "https://source.unsplash.com/featured/?graphite%20pencils"),
             BaseEquipment(name: "Fusain", description: "Pour ombrages profonds", image: "https://source.unsplash.com/featured/?charcoal%20drawing")
             ],
             technicalBasis: [
             Technique(name: "Hachures", description: "Technique pour ombrer", image: nil),
             Technique(name: "Contour", description: "Tracer le contour et proportions", image: nil)
             ]
             ),
             Hobby(
             name: .PeintureGalet,
             description: "Décorer des pierres uniques et naturelles",
             image: "https://source.unsplash.com/featured/?rock%20painting",
             level: .easy,
             category: .peinture,
             equipementNeeded: [
             BaseEquipment(name: "Galets", description: "Pierres lisses lavées", image: "https://source.unsplash.com/featured/?pebbles"),
             BaseEquipment(name: "Peinture acrylique", description: "Peinture pour surfaces", image: "https://source.unsplash.com/featured/?acrylic%20paint")
             ],
             technicalBasis: [
             Technique(name: "Mini motifs", description: "Peintures petites échelles", image: nil)
             ]
             ),
             Hobby(
             name: .Broderie,
             description: "Décorer le tissu avec des fils colorés",
             image: "https://source.unsplash.com/featured/?embroidery",
             level: .medium,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Aiguilles à broder", description: "Aiguilles adaptées", image: "https://source.unsplash.com/featured/?embroidery%20needle"),
             BaseEquipment(name: "Tambour à broder", description: "Maintient le tissu tendu", image: "https://source.unsplash.com/featured/?embroidery%20hoop")
             ],
             technicalBasis: [
             Technique(name: "Point de tige", description: "Point décoratif simple", image: nil),
             Technique(name: "Point de croix", description: "Motifs en x", image: nil)
             ]
             ),
             Hobby(
             name: .Crochet,
             description: "Créer vêtements et accessoires en maille",
             image: "https://source.unsplash.com/featured/?crochet",
             level: .medium,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Crochet", description: "Crochet adapté à la laine", image: "https://source.unsplash.com/featured/?crochet%20hook"),
             BaseEquipment(name: "Laine", description: "Fil adapté (catégorie 4 recommandé)", image: "https://source.unsplash.com/featured/?yarn")
             ],
             technicalBasis: [
             Technique(name: "Maille serrée", description: "Point de base", image: nil),
             Technique(name: "Bride", description: "Point plus haut", image: nil)
             ]
             ),
             Hobby(
             name: .Couture,
             description: "Fabriquer ou réparer ses propres vêtements",
             image: "https://source.unsplash.com/featured/?sewing",
             level: .hard,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Machine à coudre", description: "Machine pour coudre rapidement", image: "https://source.unsplash.com/featured/?sewing%20machine"),
             BaseEquipment(name: "Tissus", description: "Tissus variés", image: "https://source.unsplash.com/featured/?fabric")
             ],
             technicalBasis: [
             Technique(name: "Assemblage", description: "Couture des pièces ensemble", image: nil),
             Technique(name: "Finitions", description: "Ourlets, surpiqûres", image: nil)
             ]
             ),
             Hobby(
             name: .Poterie,
             description: "Façonner objets décoratifs à la main",
             image: "https://source.unsplash.com/featured/?pottery",
             level: .medium,
             category: .modelage,
             equipementNeeded: [
             BaseEquipment(name: "Argile", description: "Pâte à modeler", image: "https://source.unsplash.com/featured/?clay"),
             BaseEquipment(name: "Tour ou outils de modelage", description: "Outils pour former", image: "https://source.unsplash.com/featured/?pottery%20tools")
             ],
             technicalBasis: [
             Technique(name: "Modelage main", description: "Façonner sans tour", image: nil),
             Technique(name: "Cuisson", description: "Cuire l'argile au four", image: nil)
             ]
             ),
             Hobby(
             name: .Bougies,
             description: "Créer des bougies parfumées personnalisées",
             image: "https://source.unsplash.com/featured/?candle%20making",
             level: .easy,
             category: .diy,
             equipementNeeded: [
             BaseEquipment(name: "Cire", description: "Cire paraffine ou soja", image: "https://source.unsplash.com/featured/?candle%20wax"),
             BaseEquipment(name: "Mèches", description: "Mèches adaptées", image: "https://source.unsplash.com/featured/?candle%20wick")
             ],
             technicalBasis: [
             Technique(name: "Fusion", description: "Faire fondre la cire", image: nil)
             ]
             ),
             Hobby(
             name: .Savons,
             description: "Fabriquer des savons naturels et uniques",
             image: "https://source.unsplash.com/featured/?soap%20making",
             level: .medium,
             category: .diy,
             equipementNeeded: [
             BaseEquipment(name: "Bases de savon", description: "Base melt & pour ou saponification", image: "https://source.unsplash.com/featured/?soap%20base"),
             BaseEquipment(name: "Moules", description: "Moules silicone", image: "https://source.unsplash.com/featured/?soap%20mold")
             ],
             technicalBasis: [
             Technique(name: "Saponification", description: "Transformation des corps gras", image: nil)
             ]
             ),
             Hobby(
             name: .Scrapbooking,
             description: "Mettre en scène ses souvenirs créatifs",
             image: "https://source.unsplash.com/featured/?scrapbooking",
             level: .easy,
             category: .papeterie,
             equipementNeeded: [
             BaseEquipment(name: "Papiers décoratifs", description: "Feuilles imprimées", image: "https://source.unsplash.com/featured/?decorative%20paper"),
             BaseEquipment(name: "Ciseaux et colle", description: "Outils de découpe et collage", image: "https://source.unsplash.com/featured/?scissors%20glue")
             ],
             technicalBasis: [
             Technique(name: "Mise en page", description: "Composer la page", image: nil)
             ]
             ),
             Hobby(
             name: .Origami,
             description: "Plier le papier pour créer des formes",
             image: "https://source.unsplash.com/featured/?origami",
             level: .easy,
             category: .papier,
             equipementNeeded: [
             BaseEquipment(name: "Papier origami", description: "Feuilles prédécoupées", image: "https://source.unsplash.com/featured/?origami%20paper")
             ],
             technicalBasis: [
             Technique(name: "Pliage de base", description: "Valley fold, mountain fold", image: nil)
             ]
             ),
             Hobby(
             name: .Bijoux,
             description: "Assembler perles et matériaux pour s’exprimer",
             image: "https://source.unsplash.com/featured/?jewelry%20making",
             level: .medium,
             category: .accessoires,
             equipementNeeded: [
             BaseEquipment(name: "Perles", description: "Perles de différentes tailles", image: "https://source.unsplash.com/featured/?beads"),
             BaseEquipment(name: "Fil et outils", description: "Fil, pinces, fermoirs", image: "https://source.unsplash.com/featured/?jewelry%20tools")
             ],
             technicalBasis: [
             Technique(name: "Montage", description: "Assembler éléments", image: nil)
             ]
             ),
             Hobby(
             name: .Macrame,
             description: "Tisser des nœuds pour objets décoratifs",
             image: "https://source.unsplash.com/featured/?macrame",
             level: .easy,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Corde", description: "Corde coton ou jute", image: "https://source.unsplash.com/featured/?cotton%20cord"),
             BaseEquipment(name: "Support", description: "Bâton ou anneau pour suspendre", image: "https://source.unsplash.com/featured/?wooden%20dowel")
             ],
             technicalBasis: [
             Technique(name: "Nœuds de base", description: "Noeud plat, demi-noeud", image: nil)
             ]
             ),
             Hobby(
             name: .DessinNumerique,
             description: "Créer des œuvres sur tablette ou PC",
             image: "https://source.unsplash.com/featured/?digital%20art",
             level: .medium,
             category: .numerique,
             equipementNeeded: [
             BaseEquipment(name: "Tablette graphique", description: "Tablette + stylet", image: "https://source.unsplash.com/featured/?graphics%20tablet"),
             BaseEquipment(name: "Logiciel de dessin", description: "Procreate, Photoshop, etc.", image: "https://source.unsplash.com/featured/?drawing%20software")
             ],
             technicalBasis: [
             Technique(name: "Calques", description: "Organisation des éléments", image: nil)
             ]
             ),
             Hobby(
             name: .Modelisation3D,
             description: "Concevoir et façonner des objets virtuels",
             image: "https://source.unsplash.com/featured/?3D%20modeling",
             level: .hard,
             category: .numerique,
             equipementNeeded: [
             BaseEquipment(name: "Logiciel 3D", description: "Blender, Maya, etc.", image: "https://source.unsplash.com/featured/?3D%20software"),
             BaseEquipment(name: "Ordinateur puissant", description: "GPU/CPU adapté", image: "https://source.unsplash.com/featured/?powerful%20computer")
             ],
             technicalBasis: [
             Technique(name: "Modélisation", description: "Mesh modelling, sculpt", image: nil)
             ]
             ),
             Hobby(
             name: .Photomontage,
             description: "Transformer ou sublimer des images existantes",
             image: "https://source.unsplash.com/featured/?photo%20editing",
             level: .medium,
             category: .numerique,
             equipementNeeded: [
             BaseEquipment(name: "Appareil photo / smartphone", description: "Pour prendre photos", image: "https://source.unsplash.com/featured/?camera"),
             BaseEquipment(name: "Logiciel de retouche", description: "Photoshop, Affinity", image: "https://source.unsplash.com/featured/?photo%20editor")
             ],
             technicalBasis: [
             Technique(name: "Masques et calques", description: "Assembler images", image: nil)
             ]
             ),
             Hobby(
             name: .EcritureCreative,
             description: "Inventer des histoires et jouer avec les mots",
             image: "https://source.unsplash.com/featured/?creative%20writing",
             level: .easy,
             category: .ecriture,
             equipementNeeded: [
             BaseEquipment(name: "Cahier", description: "Carnet pour notes", image: "https://source.unsplash.com/featured/?notebook"),
             BaseEquipment(name: "Stylo", description: "Stylo confortable", image: "https://source.unsplash.com/featured/?pen")
             ],
             technicalBasis: [
             Technique(name: "Structure narrative", description: "Début, milieu, fin", image: nil)
             ]
             ),
             Hobby(
             name: .Calligraphie,
             description: "Dessiner de belles lettres décoratives",
             image: "https://source.unsplash.com/featured/?calligraphy",
             level: .medium,
             category: .ecriture,
             equipementNeeded: [
             BaseEquipment(name: "Plumes / feutres", description: "Outils pour lettering", image: "https://source.unsplash.com/featured/?calligraphy%20pen"),
             BaseEquipment(name: "Papier lisse", description: "Papier adapté", image: "https://source.unsplash.com/featured/?smooth%20paper")
             ],
             technicalBasis: [
             Technique(name: "Contrôle du trait", description: "Pression et inclinaison", image: nil)
             ]
             ),
             Hobby(
             name: .JournalCreatif,
             description: "Organiser ses idées avec créativité visuelle",
             image: "https://source.unsplash.com/featured/?bullet%20journal",
             level: .easy,
             category: .papeterie,
             equipementNeeded: [
             BaseEquipment(name: "Bullet journal", description: "Carnet à point", image: "https://source.unsplash.com/featured/?bullet%20journal%20notebook"),
             BaseEquipment(name: "Stickers et feutres", description: "Décorations", image: "https://source.unsplash.com/featured/?stickers%20markers")
             ],
             technicalBasis: [
             Technique(name: "Layouts", description: "Mise en page fonctionnelle", image: nil)
             ]
             )*/
        ]
        
        // Lancement asynchrone pour remplir les URL d'images (hobbies + équipements + techniques)
        
        Task {
            await loadHobbyCoverImages()
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
        /*.onAppear {
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

