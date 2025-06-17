//
//  PokemonViewModel.swift
//  Pokesteps
//
//  Created by Van Truong on 6/11/25.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
	@Published var pokemons: [Pokemon] = []
	@Published var unlockedPokemon: Pokemon? = nil
	@Published var isLoading: Bool = false
	@Published var errorMessage: String?
	@Published var searchText: String = ""
	@Published var numUnlocked: Int = 0

	private let manager = PokemonManager()

	init() {
		Task {
			await loadPokemons()
		}
	}

	var filteredPokemons: [Pokemon] {
		return searchText.isEmpty
			? pokemons
			: pokemons
			.filter {
				$0.name.contains(searchText.lowercased()) && $0.isUnlocked
			}
	}
	
	// TODO: Save Pokemon

	func loadPokemons() async {
		isLoading = true

		do {
			pokemons = try await manager.fetchPokemons()
		} catch {
			errorMessage = error.localizedDescription
		}

		isLoading = false
	}
	
	func unlockRandomPokemon() {
		let lockedPokemons = pokemons.filter { !$0.isUnlocked }
		let randomID = Int.random(in: 0...lockedPokemons.count)
		pokemons[randomID].isUnlocked = true
		numUnlocked += 1
		unlockedPokemon = pokemons[randomID]
	}
}
