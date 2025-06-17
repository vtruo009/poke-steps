//
//  PokemonView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct PokemonView: View {
	var pokemon: Pokemon

	enum ViewStyle {
		case pokedex, plain

		var foregroundColor: Color {
			switch self {
			case .pokedex:
				return .white
			case .plain:
				return .clear
			}
		}
	}

	let viewStyle: ViewStyle

	var body: some View {
		VStack {
			GeometryReader { geo in
				Circle()
					.foregroundStyle(viewStyle.foregroundColor)
					.padding()
					.overlay {
						AsyncImage(
							url: URL(
								string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.isUnlocked ? pokemon.id : 0).png"
							)
						) { image in
							image.image?
								.resizable()
								.scaledToFit()
								.frame(
									width: geo.size.width * 0.8,
									height: geo.size.width * 0.8)
						}
					}
			}
			.aspectRatio(1, contentMode: .fit)

		}
	}
}

#Preview {
	let testPokemon = Pokemon.testPokemons[2]
	PokemonView(pokemon: testPokemon, viewStyle: .pokedex)
}
