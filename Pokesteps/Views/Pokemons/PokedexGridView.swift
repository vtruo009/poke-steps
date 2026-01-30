//
//  PokedexGridView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/16/25.
//

import SwiftUI

struct PokedexGridView: View {
	@EnvironmentObject var pokemonVM: PokemonViewModel
	@EnvironmentObject var userVM: UserViewModel
	
	@State var isUnlocked = false
	@Binding var selectedPokemon: Pokemon?

	var body: some View {
		let userPokemons = userVM.user.unlockedPokemons
		
		ScrollView {
			let columns = [
				GridItem(),
				GridItem(),
			]
			Section(
				header: Text(
					"Unlocked: \(userPokemons.count)/151"
				)
				.font(.custom("JetBrainsMono-Light", size: 12))
					.font(.caption)
					.foregroundStyle(.gray)
			) {
			}

			LazyVGrid(columns: columns) {
				ForEach(
					pokemonVM.filteredPokemons
				) { pokemon in
					let isUnlocked = userVM.user.unlockedPokemons.contains(pokemon.id)
					
					Button {
						selectedPokemon = pokemon
					} label: {
						VStack {
							PokemonView(
								pokemon: pokemon,
								isUnlocked: isUnlocked,
								viewStyle: .pokedex
							)
							Text("\(isUnlocked ? pokemon.name : "???")")
						}
					}
					.id(pokemon.id)
					.buttonStyle(PlainButtonStyle())
					.disabled(!isUnlocked)
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
	@Previewable @State var userVM: UserViewModel = UserViewModel()
	
	PokedexGridView(selectedPokemon: $selectedPokemon)
		.environmentObject(PokemonViewModel(user: userVM.user))
		.environmentObject(userVM)
}
