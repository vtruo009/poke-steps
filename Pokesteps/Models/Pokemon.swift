//
//  Pokemons.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import Foundation
import SwiftUI

//struct Response: Decodable {
//    let pokemons: [Pokemon]
//
//    enum CodingKeys: String, CodingKey {
//        case pokemons = "results"
//    }
//}

struct Pokemon: Identifiable, Codable, Equatable {
	var id: Int
	var name: String
	var types: [PokemonType]
	var height: Int
	var weight: Int
	var isUnlocked: Bool

	enum PokemonType: String, CaseIterable, Codable {
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

	enum PokemonCodingKeys: String, CodingKey {
		case id, name, height, weight, sprites, types
	}

	enum PokemonSpritesCodingKeys: String, CodingKey {
		case frontDefault = "front_default"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: PokemonCodingKeys.self)

		id = try values.decode(Int.self, forKey: .id)
		name = try values.decode(String.self, forKey: .name)
		height = try values.decode(Int.self, forKey: .height)
		weight = try values.decode(Int.self, forKey: .weight)

		let typeObject = try values.decode(
			[String].self,
			forKey: .types
		)
		types = typeObject.compactMap {
			PokemonType(rawValue: $0)
		}

		isUnlocked = false
	}

	init(
		id: Int,
		name: String,
		types: [PokemonType],
		height: Int,
		weight: Int,
		isUnlocked: Bool
	) {
		self.id = id
		self.name = name
		self.types = types
		self.height = height
		self.weight = weight
		self.isUnlocked = isUnlocked
	}

	init() {
		self.init(
			id: 0,
			name: "",
			types: [],
			height: 0,
			weight: 0,
			isUnlocked: false
		)
	}

}

//struct TypesContainer: Decodable {
//	let type: TypeInfo
//
//	struct TypeInfo: Decodable {
//		let name: String
//	}
//}

extension Pokemon {
	static let testPokemons: [Pokemon] = [
		Pokemon(
			id: 1,
			name: "Bulbasaur",
			types: [.grass, .poison],
			height: 10,
			weight: 20,
			isUnlocked: false
		),
		Pokemon(
			id: 2,
			name: "Ivysaur",
			types: [.grass, .poison],
			height: 10,
			weight: 130,
			isUnlocked: false
		),
		Pokemon(
			id: 3,
			name: "Venusaur",
			types: [.grass, .poison],
			height: 40,
			weight: 80,
			isUnlocked: true
		),
		Pokemon(
			id: 4,
			name: "Charmander",
			types: [.fire],
			height: 20,
			weight: 20,
			isUnlocked: false
		),
		Pokemon(
			id: 7,
			name: "Squirtle",
			types: [.water],
			height: 20,
			weight: 25,
			isUnlocked: true
		),
		Pokemon(
			id: 25,
			name: "Pikachu",
			types: [.electric],
			height: 20,
			weight: 13,
			isUnlocked: false
		),
	]
}
