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
             image: "acrylique",
             level: .easy,
             category: .peinture,
             equipementNeeded: [
             BaseEquipment(name: "Pinceaux", description: "Ensemble de pinceaux plats et ronds", image: ""),
             BaseEquipment(name: "Toile", description: "Toile montée ou panneau entoilé", image: ""),
             BaseEquipment(name: "Palette", description: "Pour mélanger les couleurs", image: ""),
             BaseEquipment(name: "Peinture acrylique", description: "Jeu de couleurs primaires et secondaires", image: ""),
             BaseEquipment(name: "Eau et chiffon", description: "Nettoyage des pinceaux et corrections", image: ""),
             BaseEquipment(name: "Couteau à peindre", description: "Pour textures et mélanges", image: "")
             ],
             technicalBasis: [
             Technique(name: "Aplat", description: "Couche uniforme de couleur", image: ""),
             Technique(name: "Empâtement", description: "Appliquer la peinture en relief", image: ""),
             Technique(name: "Glacis", description: "Superpositions transparentes", image: nil),
             Technique(name: "Brossage à sec", description: "Effets texturés légers", image: nil),
             Technique(name: "Sous-couche", description: "Bloquer les grandes masses", image: nil)
             ]
             ),
             Hobby(
             name: .Aquarelle,
             description: "Peindre avec légèreté et transparence",
             image: "aquarelle",
             level: .medium,
             category: .peinture,
             equipementNeeded: [
             BaseEquipment(name: "Papiers aquarelle", description: "Papier 300 g/m²", image: ""),
             BaseEquipment(name: "Pinceaux à lavis", description: "Pinceaux souples pour lavis", image: ""),
             BaseEquipment(name: "Godets ou tubes aquarelle", description: "Peintures de base", image: ""),
             BaseEquipment(name: "Palette", description: "Mélange et dilution", image: ""),
             BaseEquipment(name: "Ruban adhésif", description: "Fixer le papier et éviter les gondolages", image: "")
             ],
             technicalBasis: [
             Technique(name: "Lavis", description: "Peinture très diluée", image: nil),
             Technique(name: "Dégradé", description: "Fondu de couleurs", image: nil),
             Technique(name: "Mouillé sur mouillé", description: "Effets diffus et fondus", image: nil),
             Technique(name: "Mouillé sur sec", description: "Traits précis et nets", image: nil),
             Technique(name: "Réserves", description: "Garder des blancs avec liquide de masquage", image: nil)
             ]
             ),
             Hobby(
             name: .Dessin,
             description: "Explorer le trait et les ombres",
             image: "dessin",
             level: .easy,
             category: .dessin,
             equipementNeeded: [
             BaseEquipment(name: "Crayons graphite", description: "Différentes duretés (HB, 2B, 4B)", image: ""),
             BaseEquipment(name: "Fusain", description: "Pour ombrages profonds", image: ""),
             BaseEquipment(name: "Gomme mie de pain", description: "Gomme douce pour estomper", image: ""),
             BaseEquipment(name: "Estompe", description: "Fondre les ombres", image: ""),
             BaseEquipment(name: "Bloc dessin", description: "Papier lisse ou grain fin", image: "")
             ],
             technicalBasis: [
             Technique(name: "Hachures", description: "Technique pour ombrer", image: nil),
             Technique(name: "Contour", description: "Tracer le contour et proportions", image: nil),
             Technique(name: "Perspective", description: "Points de fuite et lignes de construction", image: nil),
             Technique(name: "Valeurs", description: "Echelle du clair-obscur", image: nil)
             ]
             ),
             Hobby(
             name: .PeintureGalet,
             description: "Décorer des pierres uniques et naturelles",
             image: "peintureGalet",
             level: .easy,
             category: .peinture,
             equipementNeeded: [
             BaseEquipment(name: "Galets", description: "Pierres lisses lavées", image: ""),
             BaseEquipment(name: "Peinture acrylique", description: "Peinture pour surfaces", image: ""),
             BaseEquipment(name: "Vernis", description: "Protection et finition", image: ""),
             BaseEquipment(name: "Feutres acryliques", description: "Détails fins", image: "")
             ],
             technicalBasis: [
             Technique(name: "Mini motifs", description: "Peintures petites échelles", image: nil),
             Technique(name: "Pochoir", description: "Motifs réguliers", image: nil),
             Technique(name: "Pointillisme", description: "Décor par points", image: nil)
             ]
             ),
             Hobby(
             name: .Crochet,
             description: "Créer vêtements et accessoires en maille",
                image: "crochet",
             level: .medium,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Crochet", description: "Crochet adapté à la laine", image: ""),
             BaseEquipment(name: "Laine", description: "Fil adapté (catégorie 4 recommandé)", image: ""),
             BaseEquipment(name: "Marqueurs de maille", description: "Repérer les tours", image: ""),
             BaseEquipment(name: "Aiguille à laine", description: "Rentrer les fils", image: ""),
             BaseEquipment(name: "Mètre ruban", description: "Mesurer les dimensions", image: "")
             ],
             technicalBasis: [
             Technique(name: "Maille serrée", description: "Point de base", image: nil),
             Technique(name: "Bride", description: "Point plus haut", image: nil),
             Technique(name: "Anneau magique", description: "Démarrage circulaire", image: nil),
             Technique(name: "Augmentations / diminutions", description: "Former le volume", image: nil)
             ]
             ),
             Hobby(
             name: .Couture,
             description: "Fabriquer ou réparer ses propres vêtements",
                image: "couture",
             level: .hard,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Machine à coudre", description: "Machine pour coudre rapidement", image: ""),
             BaseEquipment(name: "Tissus", description: "Tissus variés", image: ""),
             BaseEquipment(name: "Épingles / pinces", description: "Maintenir les pièces", image: ""),
             BaseEquipment(name: "Craie tailleur", description: "Reporter les repères", image: ""),
             BaseEquipment(name: "Découd-vite", description: "Corriger les erreurs", image: "")
             ],
             technicalBasis: [
             Technique(name: "Assemblage", description: "Couture des pièces ensemble", image: nil),
             Technique(name: "Finitions", description: "Ourlets, surpiqûres", image: nil),
             Technique(name: "Patronage", description: "Tracer et ajuster les patrons", image: nil),
             Technique(name: "Surfilage", description: "Finition des bords", image: nil)
             ]
             ),
             Hobby(
             name: .Poterie,
             description: "Façonner objets décoratifs à la main",
                image: "poterie",
             level: .medium,
             category: .modelage,
             equipementNeeded: [
             BaseEquipment(name: "Argile", description: "Pâte à modeler", image: ""),
             BaseEquipment(name: "Tour ou outils de modelage", description: "Outils pour former", image: ""),
             BaseEquipment(name: "Ébauchoirs", description: "Outils de modelage", image: ""),
             BaseEquipment(name: "Barbotine", description: "Coller les pièces", image: ""),
             BaseEquipment(name: "Éponge", description: "Lisser les surfaces", image: "")
             ],
             technicalBasis: [
             Technique(name: "Modelage main", description: "Façonner sans tour", image: nil),
             Technique(name: "Cuisson", description: "Cuire l'argile au four", image: nil),
             Technique(name: "Colombin", description: "Montage en boudins", image: nil),
             Technique(name: "Plaque", description: "Montage par plaques", image: nil)
             ]
             ),
             Hobby(
             name: .Bougies,
             description: "Créer des bougies parfumées personnalisées",
                image: "bougie",
             level: .easy,
             category: .diy,
             equipementNeeded: [
             BaseEquipment(name: "Cire", description: "Cire paraffine ou soja", image: ""),
             BaseEquipment(name: "Mèches", description: "Mèches adaptées", image: ""),
             BaseEquipment(name: "Thermomètre", description: "Contrôler la température", image: ""),
             BaseEquipment(name: "Parfums et colorants", description: "Personnalisation", image: ""),
             BaseEquipment(name: "Récipients", description: "Verres ou moules", image: "")
             ],
             technicalBasis: [
             Technique(name: "Fusion", description: "Faire fondre la cire", image: nil),
             Technique(name: "Coulée en contenant", description: "Bougies en pot", image: nil),
             Technique(name: "Démoulage", description: "Sortir la bougie du moule", image: nil)
             ]
             ),
             
             Hobby(
             name: .Broderie,
             description: "Décorer le tissu avec des fils colorés",
                image: "broderie",
             level: .medium,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Aiguilles à broder", description: "Aiguilles adaptées", image: ""),
             BaseEquipment(name: "Tambour à broder", description: "Maintient le tissu tendu", image: ""),
             BaseEquipment(name: "Fils mouliné", description: "Coton DMC ou équivalent", image: ""),
             BaseEquipment(name: "Ciseaux broderie", description: "Pointes fines", image: "")
             ],
             technicalBasis: [
             Technique(name: "Point de tige", description: "Point décoratif simple", image: nil),
             Technique(name: "Point de croix", description: "Motifs en x", image: nil),
             Technique(name: "Point arrière", description: "Lignes continues", image: nil),
             Technique(name: "Point de nœud", description: "Petits reliefs", image: nil)
             ]
             ),
             Hobby(
             name: .Savons,
             description: "Fabriquer des savons naturels et uniques",
                image: "savon",
             level: .medium,
             category: .diy,
             equipementNeeded: [
             BaseEquipment(name: "Bases de savon", description: "Base melt & pour ou saponification", image: ""),
             BaseEquipment(name: "Moules", description: "Moules silicone", image: ""),
             BaseEquipment(name: "Soude caustique", description: "Saponification à froid (précautions)", image: ""),
             BaseEquipment(name: "Balance de précision", description: "Dosage exact", image: ""),
             BaseEquipment(name: "Gants et lunettes", description: "Sécurité", image: "")
             ],
             technicalBasis: [
             Technique(name: "Saponification", description: "Transformation des corps gras", image: nil),
             Technique(name: "Trace", description: "Point de prise du mélange", image: nil),
             Technique(name: "Marbrage", description: "Effets de motifs", image: nil)
             ]
             ),
             Hobby(
             name: .Scrapbooking,
             description: "Mettre en scène ses souvenirs créatifs",
                image: "scrapbooking",
             level: .easy,
             category: .papeterie,
             equipementNeeded: [
             BaseEquipment(name: "Papiers décoratifs", description: "Feuilles imprimées", image: ""),
             BaseEquipment(name: "Ciseaux et colle", description: "Outils de découpe et collage", image: ""),
             BaseEquipment(name: "Massicot", description: "Découpe droite et nette", image: ""),
             BaseEquipment(name: "Tampons et encres", description: "Décorations", image: ""),
             BaseEquipment(name: "Coins photo", description: "Fixation non permanente", image: "")
             ],
             technicalBasis: [
             Technique(name: "Mise en page", description: "Composer la page", image: nil),
             Technique(name: "Matting", description: "Couches de papier autour des photos", image: nil),
             Technique(name: "Embossage", description: "Relief à chaud", image: nil)
             ]
             ),
             Hobby(
             name: .Origami,
             description: "Plier le papier pour créer des formes",
                image: "origami",
             level: .easy,
             category: .papier,
             equipementNeeded: [
             BaseEquipment(name: "Papier origami", description: "Feuilles prédécoupées", image: ""),
             BaseEquipment(name: "Plioir", description: "Marquer les plis", image: ""),
             BaseEquipment(name: "Papier kami", description: "Fin et robuste", image: "")
             ],
             technicalBasis: [
             Technique(name: "Pliage de base", description: "Valley fold, mountain fold", image: nil),
             Technique(name: "Base de l'oiseau", description: "Pli fondamental", image: nil),
             Technique(name: "Base de la grenouille", description: "Pli fondamental", image: nil)
             ]
             ),
             Hobby(
             name: .Bijoux,
             description: "Assembler perles et matériaux pour s’exprimer",
                image: "bijoux",
             level: .medium,
             category: .accessoires,
             equipementNeeded: [
             BaseEquipment(name: "Perles", description: "Perles de différentes tailles", image: ""),
             BaseEquipment(name: "Fil et outils", description: "Fil, pinces, fermoirs", image: ""),
             BaseEquipment(name: "Pinces plates et coupantes", description: "Travail des apprêts", image: ""),
             BaseEquipment(name: "Fils / câbles", description: "Montage et solidité", image: ""),
             BaseEquipment(name: "Tapis de perlage", description: "Éviter que les perles roulent", image: "")
             ],
             technicalBasis: [
             Technique(name: "Montage", description: "Assembler éléments", image: nil),
             Technique(name: "Boucles et anneaux", description: "Former des attaches", image: nil),
             Technique(name: "Tissage de perles", description: "Points peyote, brick", image: nil)
             ]
             ),
             Hobby(
             name: .Macrame,
             description: "Tisser des nœuds pour objets décoratifs",
                image: "macrame",
             level: .easy,
             category: .textile,
             equipementNeeded: [
             BaseEquipment(name: "Corde", description: "Corde coton ou jute", image: ""),
             BaseEquipment(name: "Support", description: "Bâton ou anneau pour suspendre", image: ""),
             BaseEquipment(name: "Peigne", description: "Brosser les franges", image: ""),
             BaseEquipment(name: "Ciseaux", description: "Coupe propre", image: "")
             ],
             technicalBasis: [
             Technique(name: "Nœuds de base", description: "Noeud plat, demi-noeud", image: nil),
             Technique(name: "Noeud torsadé", description: "Variante du demi-noeud", image: nil),
             Technique(name: "Noeud d'alouette", description: "Fixer les cordes", image: nil)
             ]
             ),
             Hobby(
             name: .DessinNumerique,
             description: "Créer des œuvres sur tablette ou PC",
                image: "dessinNumerique",
             level: .medium,
             category: .numerique,
             equipementNeeded: [
             BaseEquipment(name: "Tablette graphique", description: "Tablette + stylet", image: ""),
             BaseEquipment(name: "Logiciel de dessin", description: "Procreate, Photoshop, etc.", image: ""),
             BaseEquipment(name: "Gants anti-friction", description: "Glisse sur la tablette", image: ""),
             BaseEquipment(name: "Brosses numériques", description: "Packs de pinceaux", image: "")
             ],
             technicalBasis: [
             Technique(name: "Calques", description: "Organisation des éléments", image: nil),
             Technique(name: "Rendu", description: "Lumière et matières", image: nil),
             Technique(name: "Raccourcis clavier", description: "Flux de travail efficace", image: nil)
             ]
             ),
             Hobby(
             name: .Modelisation3D,
             description: "Concevoir et façonner des objets virtuels",
                image: "modelisation3D",
             level: .hard,
             category: .numerique,
             equipementNeeded: [
             BaseEquipment(name: "Logiciel 3D", description: "Blender, Maya, etc.", image: ""),
             BaseEquipment(name: "Ordinateur puissant", description: "GPU/CPU adapté", image: ""),
             BaseEquipment(name: "Souris 3D / trackball", description: "Navigation précise", image: ""),
             BaseEquipment(name: "Bibliothèques de textures", description: "Matériaux réalistes", image: "")
             ],
             technicalBasis: [
             Technique(name: "Modélisation", description: "Mesh modelling, sculpt", image: nil),
             Technique(name: "UV mapping", description: "Dépliage des textures", image: nil),
             Technique(name: "Subdivision / retopologie", description: "Optimisation du maillage", image: nil)
             ]
             ),
             Hobby(
             name: .Photomontage,
             description: "Transformer ou sublimer des images existantes",
                image: "photomontage",
             level: .medium,
             category: .numerique,
             equipementNeeded: [
             BaseEquipment(name: "Appareil photo / smartphone", description: "Pour prendre photos", image: ""),
             BaseEquipment(name: "Logiciel de retouche", description: "Photoshop, Affinity", image: ""),
             BaseEquipment(name: "Tablette graphique (optionnel)", description: "Détourage précis", image: ""),
             BaseEquipment(name: "Banques d'images", description: "Ressources libres de droits", image: "")
             ],
             technicalBasis: [
             Technique(name: "Masques et calques", description: "Assembler images", image: nil),
             Technique(name: "Détourage", description: "Sélections avancées", image: nil),
             Technique(name: "Corrections colorimétriques", description: "Courbes, niveaux", image: nil)
             ]
             ),
             Hobby(
             name: .EcritureCreative,
             description: "Inventer des histoires et jouer avec les mots",
                image: "ecritureCreative",
             level: .easy,
             category: .ecriture,
             equipementNeeded: [
             BaseEquipment(name: "Cahier", description: "Carnet pour notes", image: ""),
             BaseEquipment(name: "Stylo", description: "Stylo confortable", image: ""),
             BaseEquipment(name: "Timer", description: "Sprints d'écriture", image: ""),
             BaseEquipment(name: "Applications de notes", description: "Organisation des idées", image: "")
             ],
             technicalBasis: [
             Technique(name: "Structure narrative", description: "Début, milieu, fin", image: nil),
             Technique(name: "Brainstorming", description: "Générer des idées", image: nil),
             Technique(name: "Plan détaillé", description: "Structure chapitre par chapitre", image: nil)
             ]
             ),
             Hobby(
             name: .Calligraphie,
             description: "Dessiner de belles lettres décoratives",
                image: "caligraphie",
             level: .medium,
             category: .ecriture,
             equipementNeeded: [
             BaseEquipment(name: "Plumes / feutres", description: "Outils pour lettering", image: ""),
             BaseEquipment(name: "Papier lisse", description: "Papier adapté", image: ""),
             BaseEquipment(name: "Encres", description: "Différentes viscosités", image: ""),
             BaseEquipment(name: "Guide-lignes", description: "Maintenir l'angle et la hauteur", image: "")
             ],
             technicalBasis: [
             Technique(name: "Contrôle du trait", description: "Pression et inclinaison", image: nil),
             Technique(name: "Ductus", description: "Ordre et sens des traits", image: nil),
             Technique(name: "Variations de pression", description: "Pleins et déliés", image: nil)
             ]
             ),
             Hobby(
             name: .JournalCreatif,
             description: "Organiser ses idées avec créativité visuelle",
                image: "journalCreatif",
             level: .easy,
             category: .papeterie,
             equipementNeeded: [
             BaseEquipment(name: "Bullet journal", description: "Carnet à point", image: ""),
             BaseEquipment(name: "Stickers et feutres", description: "Décorations", image: ""),
             BaseEquipment(name: "Règle et pochoirs", description: "Aider à tracer", image: ""),
             BaseEquipment(name: "Stickers / washi tape", description: "Décoration rapide", image: "")
             ],
             technicalBasis: [
             Technique(name: "Layouts", description: "Mise en page fonctionnelle", image: nil),
             Technique(name: "Habitudes et trackers", description: "Suivi visuel", image: nil),
             Technique(name: "Lettrage", description: "Titres et rubriques stylisées", image: nil)
             ]
             )
        ]
    }
    
//    func loadHobbyCoverImages() async {
//        await withTaskGroup(of: Void.self) { group in
//            for hobbyIndex in hobbies.indices {
//                group.addTask(priority: .medium) { [weak self] in
//                    guard let self = self else { return }
//                    
//                    let hobbyName = await self.hobbies[hobbyIndex].name.rawValue
//                    let hobby = await self.hobbies[hobbyIndex]
//                    
//                    if hobby.image.isEmpty {
//                        if let url = await self.unsplash.fetchImageURL(for: hobbyName) {
//                            await MainActor.run {
//                                self.hobbies[hobbyIndex].image = url
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
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

