//
//  Pokemons.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import Foundation
import SwiftUI

struct Pokemon: Identifiable, Codable {
    var id: Int
    var name: String
    var image: String
    var type: [PokemonType]
    var height: Double
    var weight: Double

    enum PokemonType: CaseIterable, Codable {
        case fire
        case water
        case grass
        case poison
        case electric
        case ground
        case rock
        case normal
        case ice
        case fighting
        case flying
        case psychic
        case bug
        case ghost
        case dragon
        case dark
        case steel
        case fairy

        var color: Color {
            switch self {
            case .fire:
                return Color(hex: "#EE8130")
            case .water:
                return Color(hex: "#6390F0")
            case .grass:
                return Color(hex: "#7AC74C")
            case .poison:
                return Color(hex: "#A33EA1")
            case .electric:
                return Color(hex: "#F7D02C")
            case .ground:
                return Color(hex: "#E2BF65")
            case .rock:
                return Color(hex: "#B6A136")
            case .normal:
                return Color(hex: "#A8A77A")
            case .ice:
                return Color(hex: "#96D9D6")
            case .fighting:
                return Color(hex: "#C22E28")
            case .flying:
                return Color(hex: "#A98FF3")
            case .psychic:
                return Color(hex: "#F95587")
            case .bug:
                return Color(hex: "#A6B91A")
            case .ghost:
                return Color(hex: "#735797")
            case .dragon:
                return Color(hex: "#6F35FC")
            case .dark:
                return Color(hex: "#705746")
            case .steel:
                return Color(hex: "#B7B7CE")
            case .fairy:
                return Color(hex: "#D685AD")
            }
        }
    }
    
    init(
        id: Int,
        name: String,
        image: String,
        type: [PokemonType],
        height: Double,
        weight: Double
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.type = type
        self.height = height
        self.weight = weight
    }
    
    init() {
        self.init(
            id: 0,
            name: "",
            image: "",
            type: [],
            height: 0,
            weight: 0
        )
    }
}

extension Pokemon {
    static let testPokemons: [Pokemon] = [
        Pokemon(
            id: 1,
            name: "Bulbasaur",
            image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
            type: [.grass,.poison],
            height: 10,
            weight: 20
        ),
        Pokemon(
            id: 2,
            name: "Ivysaur",
            image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png",
            type: [.grass,.poison],
            height: 20,
            weight: 40
        ),
        Pokemon(
            id: 3,
            name: "Venusaur",
            image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
            type: [.grass,.poison],
            height: 40,
            weight: 80
        ),
        Pokemon(
            id: 4,
            name: "Charmander",
            image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
            type: [.fire],
            height: 20,
            weight: 20
        ),
        Pokemon(
            id: 7,
            name: "Squirtle",
            image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
            type: [.water],
            height: 20,
            weight: 25
        ),
        Pokemon(
            id: 25,
            name: "Pikachu",
            image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
            type: [.electric],
            height: 20,
            weight: 13
        ),
    ]
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)

        let a: UInt64
        let r: UInt64
        let g: UInt64
        let b: UInt64

        switch hex.count {
        case 3:
            (a, r, g, b) = (
                255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17
            )
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (
                int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF
            )
        default:
            (a, r, g, b) = (255, 0, 0, 0)  // fallback to black
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
