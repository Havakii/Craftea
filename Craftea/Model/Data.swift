//
//  Data.swift
//  Craftea
//
//  Created by apprenant75 on 27/10/2025.
//

import Foundation

var users: [User] = [

    User(name: "Lora-Line", surname: "Faure", mail: "Lora-Line@gmail.com", pseudo: "Lora-Line", password: "123456", recommandations: [Hobby(
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
        )])
]

//var hobbies: [Hobby] = [
//    Hobby(name: .Crochet, description: "Créer vêtements et accessoires en maille", image: "", level: .medium, category: .textile, equipementNeeded: [],technicalBasis: []) ]


