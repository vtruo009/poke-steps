//
//  PokemonViewModel.swift
//  Pokesteps
//
//  Created by Van Truong on 6/11/25.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
	@Published var user: User
	@Published var pokemons: [Pokemon] = []
	@Published var unlockedPokemon: Pokemon? = nil
	@Published var isLoading: Bool = false
	@Published var errorMessage: String?
	@Published var searchText: String = ""

	private let manager = PokemonManager()

	init(user: User) {
		self.user = user
		Task {
			await loadPokemons()
		}
	}
	
	func updateUser(_ newUser: User) {
		self.user = newUser
	}

	var filteredPokemons: [Pokemon] {
		return searchText.isEmpty
			? pokemons
			: pokemons
			.filter {
				$0.name
					.contains(searchText.lowercased()) && user.unlockedPokemons
					.contains($0.id)
			}
	}
	
	func loadPokemons() async {
		isLoading = true
		
		Task {
			do {
				let pokemons = try await PokemonsRepository.loadPokemons()
				self.pokemons = pokemons
			} catch {
				print("Error loading Pokemons: \(error)")
			}
		}

		isLoading = false
	}
	
	func unlockRandomPokemon() -> Int {
		let lockedPokemons = pokemons.filter {
			!user.unlockedPokemons.contains($0.id)
		}
		let randomID = Int.random(in: 0...lockedPokemons.count)
		
		unlockedPokemon = pokemons[randomID]
		return randomID + 1
	}
}
