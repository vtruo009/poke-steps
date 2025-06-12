//
//  PokemonData.swift
//  Pokesteps
//
//  Created by Van Truong on 6/10/25.
//

import Foundation

class PokemonManager {
    func fetchPokemons() async throws -> [Pokemon] {
        return try await PokemonFetchingClient.getPokemons()
    }
}
