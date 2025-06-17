//
//  PokedexView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct PokedexView: View {
	@EnvironmentObject var pokemonVM: PokemonViewModel

	//	    var pokemons = Pokemon.testPokemons
	@State var selectedPokemon: Pokemon? = nil

	var body: some View {
		NavigationView {
			if pokemonVM.pokemons.isEmpty {
				//			if pokemons.isEmpty {
				ProgressView("Loading Pokémons...")
			} else {
				ScrollViewReader { value in
					PokedexGridView(selectedPokemon: $selectedPokemon)
						.sheet(item: $selectedPokemon) { pokemon in
							NavigationView {
								PokemonDetailsView(pokemon: pokemon)
									.toolbar {
										ToolbarItem(
											placement: .cancellationAction
										) {
											Button("Close") {
												selectedPokemon = nil
											}
										}
									}
							}
						}
						.background(AppColor.background)
						.navigationTitle("Pokédex")
						.toolbarBackground(
							AppColor.background,
							for: .navigationBar
						)
						.onAppear {
							if let unlocked = pokemonVM.unlockedPokemon {
								withAnimation(.smooth) {
									value.scrollTo(unlocked.id, anchor: .center)
								}
								pokemonVM.unlockedPokemon = nil
							}
						}
				}
			}
		}
		.searchable(text: $pokemonVM.searchText, prompt: "Search Pokédex")
	}
}

#Preview {
	PokedexView()
		.environmentObject(PokemonViewModel())
}
