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
	@Published var isLoading: Bool = false
	@Published var errorMessage: String?
	@Published var searchText: String = ""

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
				.filter { $0.name.contains(searchText.lowercased()) }
	}

	func loadPokemons() async {
		isLoading = true

		do {
			pokemons = try await manager.fetchPokemons()
		} catch {
			errorMessage = error.localizedDescription
		}

		isLoading = false
	}
}
