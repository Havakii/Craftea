//
//  Data.swift
//  Craftea
//
//  Created by apprenant75 on 27/10/2025.
//

import Foundation

var users: [User] = [
    User(name: "Ethan", surname: "Urie", mail: "Ethan25@gmail.com", pseudo: "Ethan", password: "123456", recommandations: [Hobby(
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
        Technique(name: "Aplat", but: "Obtenir une surface de couleur uniforme et opaque.", description: "Prépare ta couleur sur la palette, charge un pinceau plat, puis peins des bandes parallèles en chevauchant légèrement pour éviter les traces. Lisse rapidement avant séchage.", image: ""),
        Technique(name: "Empâtement", but: "Créer du relief et de la texture visibles.", description: "Prélève une grosse quantité d’acrylique avec un couteau à peindre et dépose-la en couches épaisses. Étale ou tapote pour former des crêtes et laisse sécher sans trop retravailler.", image: ""),
        Technique(name: "Glacis", but: "Modifier subtilement la teinte et la lumière par transparence.", description: "Mélange la peinture avec un médium ou de l’eau pour obtenir une couche très transparente, puis passe-la uniformément sur une couche sèche. Répète pour intensifier.", image: nil),
        Technique(name: "Brossage à sec", but: "Souligner les reliefs et créer un effet texturé.", description: "Essuie presque entièrement le pinceau, prends un peu de peinture, puis frotte légèrement la surface en effleurant les reliefs pour ne teinter que les arêtes.", image: nil),
        Technique(name: "Sous-couche", but: "Définir rapidement les valeurs et les grandes formes.", description: "Dilue la peinture et pose une première couche colorée sur toute la surface. Indique les zones claires/sombres et les volumes avant les détails.", image: nil)
        ], popular: true
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
        Technique(name: "Lavis", but: "Poser une teinte légère et homogène.", description: "Mouille ton pinceau, dilue fortement la couleur et applique-la en aplat régulier sur papier incliné. Éponge les surplus pour éviter les auréoles.", image: nil),
        Technique(name: "Dégradé", but: "Passer progressivement d’une couleur à une autre.", description: "Pose deux couleurs voisines sur papier humide, puis travaille la zone de jonction en allers-retours doux pour fondre les teintes.", image: nil),
        Technique(name: "Mouillé sur mouillé", but: "Obtenir des transitions douces et des bords flous.", description: "Humidifie le papier, charge ton pinceau et dépose la couleur sur la zone humide. Laisse les pigments se diffuser naturellement.", image: nil),
        Technique(name: "Mouillé sur sec", but: "Tracer des formes nettes et contrôlées.", description: "Attends que le papier soit complètement sec, puis peins avec peu d’eau pour garder des contours nets et précis.", image: nil),
        Technique(name: "Réserves", but: "Préserver des zones blanches intactes.", description: "Applique du liquide de masquage sur les zones à protéger. Peins librement autour, laisse sécher, puis retire le masque délicatement.", image: nil)
        ], popular: true
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
        Technique(name: "Hachures", but: "Créer des ombres et des textures par lignes.", description: "Trace des séries de lignes parallèles régulières, puis croise-les pour foncer. Varie l’espacement et la pression pour moduler la valeur.", image: nil),
        Technique(name: "Contour", but: "Définir la silhouette et les proportions justes.", description: "Esquisse légèrement les formes principales, vérifie les alignements et corrige avant d’appuyer sur les lignes finales.", image: nil),
        Technique(name: "Perspective", but: "Donner une impression d’espace crédible.", description: "Place l’horizon, fixe un ou plusieurs points de fuite et trace les lignes de construction en respectant la convergence.", image: nil),
        Technique(name: "Valeurs", but: "Structurer le volume par contrastes de clair-obscur.", description: "Choisis une source de lumière, établis 3–5 niveaux de gris et ombre progressivement en gardant une transition douce.", image: nil)
        ], popular: true
        )]),
    User(name: "Nathan",surname: "Dufresne",mail: "Ethan@gmail.com",pseudo: "Ethan",password: "123456",favoritesHobby: []),
    User(name:"Pauline",surname: "Lefèvre",mail: "Pauline@gmail.com",pseudo: "Pauline",password: "123456",favoritesHobby: []),
    User(name: "Pierre",surname: "Thomas",mail: "Pierre@gmail.com",pseudo: "Pierre",password: "123456",favoritesHobby: []),
    User(name: "Marc",surname: "Sellier",mail: "Marc@gmail.com",pseudo: "Marc",password: "123456",favoritesHobby: []),
    User(name: "Brendon", surname: "Urie", mail: "brendon@gmail.com", pseudo: "Brendon", password: "123456", favoritesHobby: [])
    ,
    User(name: "Nora", surname: "Martin", mail: "nora.martin@gmail.com", pseudo: "Nora", password: "123456", favoritesHobby: []),
    User(name: "Lucas", surname: "Bernard", mail: "lucas.bernard@gmail.com", pseudo: "LucasB", password: "123456", favoritesHobby: []),
    User(name: "Emma", surname: "Rousseau", mail: "emma.rousseau@gmail.com", pseudo: "EmmaR", password: "123456", favoritesHobby: []),
    User(name: "Hugo", surname: "Moreau", mail: "hugo.moreau@gmail.com", pseudo: "HugoM", password: "123456", favoritesHobby: []),
    User(name: "Chloé", surname: "Dupont", mail: "chloe.dupont@gmail.com", pseudo: "ChloeD", password: "123456", favoritesHobby: []),
    User(name: "Jules", surname: "Petit", mail: "jules.petit@gmail.com", pseudo: "JulesP", password: "123456", favoritesHobby: []),
    User(name: "Sarah", surname: "Lemoine", mail: "sarah.lemoine@gmail.com", pseudo: "SarahL", password: "123456", favoritesHobby: []),
    User(name: "Yanis", surname: "Garcia", mail: "yanis.garcia@gmail.com", pseudo: "YanisG", password: "123456", favoritesHobby: []),
    User(name: "Mila", surname: "Fabre", mail: "mila.fabre@gmail.com", pseudo: "MilaF", password: "123456", favoritesHobby: []),
    User(name: "Noah", surname: "Chevalier", mail: "noah.chevalier@gmail.com", pseudo: "NoahC", password: "123456", favoritesHobby: [])

]

// Données Occasion
var materielsOccasion: [Materiel] = [
    Materiel(nom: "Peinture rouge", image: "", description: "Pot de peinture rouge presque plein", vendeur: users[1], typeMateriel: .don),
    Materiel(nom: "Pinceaux ronds", image: "", description: "Lot de pinceaux ronds taille mixte", vendeur: users[0], typeMateriel: .pret),
    Materiel(nom: "Palette plastique", image: "", description: "Palette 10 godets peu utilisée", vendeur: users[2], typeMateriel: .echange),
    Materiel(nom: "Toiles 30x40", image: "", description: "Pack de 3 toiles vierges", vendeur: users[3], typeMateriel: .don),
    Materiel(nom: "Aquarelle godets", image: "", description: "Palette 12 couleurs classiques", vendeur: users[4], typeMateriel: .pret),
    Materiel(nom: "Papier aquarelle", image: "", description: "Bloc 300g/m² 20 feuilles", vendeur: users[5], typeMateriel: .echange),
    Materiel(nom: "Crayons graphite", image: "", description: "Set HB à 8B", vendeur: users[6], typeMateriel: .don),
    Materiel(nom: "Fusains", image: "", description: "Bâtons de fusain tendre et moyen", vendeur: users[7], typeMateriel: .pret),
    Materiel(nom: "Carnet dessin", image: "", description: "Carnet A4 grain fin", vendeur: users[8], typeMateriel: .echange),
    Materiel(nom: "Feutres alcool", image: "", description: "Lot de 24 couleurs", vendeur: users[9], typeMateriel: .don),
    Materiel(nom: "Fil coton", image: "", description: "Bobines multicolores pour couture", vendeur: users[10], typeMateriel: .pret),
    Materiel(nom: "Aiguilles couture", image: "", description: "Assortiment d’aiguilles", vendeur: users[11], typeMateriel: .echange),
    Materiel(nom: "Tissu lin", image: "", description: "Coupon 1m x 1,5m", vendeur: users[12], typeMateriel: .don),
    Materiel(nom: "Machine à coudre", image: "", description: "Ancien modèle en état correct", vendeur: users[13], typeMateriel: .pret),
    Materiel(nom: "Laine", image: "", description: "Pelotes de laine colorées", vendeur: users[14], typeMateriel: .echange),
    Materiel(nom: "Crochets", image: "", description: "Crochets tailles 2 à 6", vendeur: users[15], typeMateriel: .don),
    Materiel(nom: "Perles", image: "", description: "Mélange de perles en verre", vendeur: users[4], typeMateriel: .pret),
    Materiel(nom: "Fil nylon", image: "", description: "Fil transparent pour bijoux", vendeur: users[14], typeMateriel: .echange),
    Materiel(nom: "Colle forte", image: "", description: "Tube de colle multi-usage", vendeur: users[5], typeMateriel: .don),
    Materiel(nom: "Pistolet à colle", image: "", description: "Avec quelques bâtons", vendeur: users[2], typeMateriel: .pret),
    Materiel(nom: "Carton plume", image: "", description: "Plaques A3 pour maquettes", vendeur: users[8], typeMateriel: .echange),
    Materiel(nom: "Cutter", image: "", description: "Cutter de précision", vendeur: users[11], typeMateriel: .don),
    Materiel(nom: "Papiers scrap", image: "", description: "Lot de papiers motifs", vendeur: users[4], typeMateriel: .pret)
    
]
// Données Neuf
var materielsNeuf: [MaterielPro] = [
    MaterielPro(nom: "Set pinceaux pro", image: "", description: "Ensemble de 12 pinceaux de qualité professionnelle", vendeur: "ArtSupply Co.", prix: "24,90 €"),
    MaterielPro(nom: "Toile 40x50 cm", image: "", description: "Toile en coton 100% grain moyen", vendeur: "CanvasPlus", prix: "9,99 €"),
    MaterielPro(nom: "Palette bois", image: "", description: "Palette ovale en bois verni", vendeur: "Peinture&Co", prix: "7,50 €"),
    MaterielPro(nom: "Acrylique primaires", image: "", description: "Set de 6 tubes 75ml couleurs primaires", vendeur: "ColorMix", prix: "19,90 €"),
    MaterielPro(nom: "Médium acrylique", image: "", description: "Médium brillant 250ml pour glacis", vendeur: "ArtLab", prix: "8,99 €"),
    MaterielPro(nom: "Ruban de masquage", image: "", description: "Ruban 25mm spécial aquarelle", vendeur: "PaperHouse", prix: "3,20 €"),
    MaterielPro(nom: "Papier aquarelle 300g", image: "", description: "Bloc A4 20 feuilles grain fin", vendeur: "AquaPro", prix: "14,50 €"),
    MaterielPro(nom: "Aquarelle 12 godets", image: "", description: "Palette compacte 12 couleurs", vendeur: "AquaPro", prix: "17,99 €"),
    MaterielPro(nom: "Pinceau à lavis", image: "", description: "Pinceau mop taille 4 en poils synthétiques", vendeur: "BrushWorks", prix: "11,90 €"),
    MaterielPro(nom: "Gomme mie de pain", image: "", description: "Gomme souple pour estompe et lumière", vendeur: "SketchLine", prix: "2,50 €"),
    MaterielPro(nom: "Crayons graphite set", image: "", description: "Set de 12 crayons HB à 8B", vendeur: "SketchLine", prix: "12,90 €"),
    MaterielPro(nom: "Estompes x6", image: "", description: "Lot d'estompes tailles assorties", vendeur: "SketchLine", prix: "4,20 €"),
    MaterielPro(nom: "Feutres à alcool 24", image: "", description: "Set 24 couleurs double pointe", vendeur: "MarkerPro", prix: "22,90 €"),
    MaterielPro(nom: "Carnet de croquis A5", image: "", description: "Carnet 120 pages papier 120g", vendeur: "PaperHouse", prix: "6,80 €"),
    MaterielPro(nom: "Cutter de précision", image: "", description: "Cutter métal avec 5 lames", vendeur: "CraftTools", prix: "5,99 €"),
    MaterielPro(nom: "Colle forte", image: "", description: "Colle multi-usage 20g", vendeur: "CraftTools", prix: "3,10 €"),
    MaterielPro(nom: "Pistolet à colle", image: "", description: "Pistolet mini avec 10 bâtons", vendeur: "CraftTools", prix: "12,50 €"),
    MaterielPro(nom: "Carton plume A3", image: "", description: "Plaques A3 5mm (pack de 5)", vendeur: "Model&Build", prix: "9,40 €"),
    MaterielPro(nom: "Tissu coton 1m", image: "", description: "Coupon coton 1m x 1,5m", vendeur: "Sew&Go", prix: "8,90 €"),
    MaterielPro(nom: "Aiguilles couture", image: "", description: "Assortiment 30 aiguilles", vendeur: "Sew&Go", prix: "2,80 €"),
    MaterielPro(nom: "Laine mérinos", image: "", description: "Pelote 50g coloris océan", vendeur: "KnitHouse", prix: "4,90 €"),
    MaterielPro(nom: "Crochets set", image: "", description: "Set de crochets 2mm à 6mm", vendeur: "KnitHouse", prix: "10,90 €"),
    MaterielPro(nom: "Perles en verre", image: "", description: "Mélange 200g couleurs assorties", vendeur: "Bijoux&Co", prix: "6,50 €"),
    MaterielPro(nom: "Fil nylon", image: "", description: "Bobine 100m transparent", vendeur: "Bijoux&Co", prix: "3,60 €"),
    MaterielPro(nom: "Feuilles scrap", image: "", description: "Pack 24 feuilles motifs", vendeur: "ScrapWorld", prix: "7,90 €"),
    MaterielPro(nom: "Ciseaux cranteurs", image: "", description: "Ciseaux motifs pour scrapbooking", vendeur: "ScrapWorld", prix: "5,70 €"),
    MaterielPro(nom: "Encre de Chine", image: "", description: "Flacon 50ml noir profond", vendeur: "InkMaster", prix: "4,40 €"),
    MaterielPro(nom: "Plume et porte-plume", image: "", description: "Set calligraphie débutant", vendeur: "InkMaster", prix: "9,90 €"),
    MaterielPro(nom: "Chevalet de table", image: "", description: "Chevalet pliable en bois", vendeur: "StudioGear", prix: "18,90 €"),
    MaterielPro(nom: "Nettoyant pinceaux", image: "", description: "Savon spécial pinceaux 85g", vendeur: "BrushWorks", prix: "3,90 €")
    
]

let homePhrases: [String] = [
    "Débloque ta créativité sans limites !",
    "Crée, partage, inspire.",
    "Laisse parler tes mains.",
    "Transforme une envie en projet.",
    "Trouve ton prochain coup de cœur créatif.",
    "Partage ton matos, multiplie les idées.",
    "Ose expérimenter, ose t'amuser.",
    "Chaque création commence par un essai.",
    "Fais de ta curiosité une création."
]
