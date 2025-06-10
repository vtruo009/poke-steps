//
//  PokemonData.swift
//  Pokesteps
//
//  Created by Van Truong on 6/10/25.
//

import Foundation

@MainActor
class PokemonData: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    init() {
        Task {
            do {
                let pokemons = try await PokemonFetchingClient.getPokemons()
                self.pokemons = pokemons
            } catch {
                print(error)
            }
        }
    }
}
