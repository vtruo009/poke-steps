//
//  PokedexGridView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/16/25.
//

import SwiftUI

struct PokedexGridView: View {
	@EnvironmentObject var pokemonVM: PokemonViewModel
	@Binding var selectedPokemon: Pokemon?

	var body: some View {
		ScrollView {
			let columns = [
				GridItem(),
				GridItem(),
			]
			Section(
				header: Text("Unlocked: \(pokemonVM.numUnlocked)/151")
					.font(.caption)
					.foregroundStyle(.gray)
			) {
			}

			LazyVGrid(columns: columns) {
				ForEach(
					pokemonVM.filteredPokemons
				) { pokemon in
					Button {
						selectedPokemon = pokemon
					} label: {
						VStack {
							PokemonView(
								pokemon: pokemon,
								viewStyle: .pokedex
							)
							Text("\(pokemon.isUnlocked ? pokemon.name : "???")")
								.font(.system(size: 20))
								.padding(.bottom)
								.padding(.top, -15)
						}
					}
					.id(pokemon.id)
					.buttonStyle(PlainButtonStyle())
					.disabled(!pokemon.isUnlocked)
				}
			}
			.animation(
				.easeIn(duration: 0.3),
				value: pokemonVM.filteredPokemons
			)
			.padding(.horizontal, 10)
		}
	}
}

#Preview {
	@Previewable @State var selectedPokemon: Pokemon? = Pokemon.testPokemons[4]
	PokedexGridView(selectedPokemon: $selectedPokemon)
		.environmentObject(PokemonViewModel())
}
