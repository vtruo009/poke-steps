//
//  PokemonFetchingClient.swift
//  Pokesteps
//
//  Created by Van Truong on 6/10/25.
//

import Foundation

struct PokemonFetchingClient {
    static func getPokemons() async throws -> [Pokemon] {
        var pokemons: [Pokemon] = []
        for i in 1...151 {
            async let (data, _) = URLSession.shared.data(
                from: URL(string: "https://pokeapi.co/api/v2/pokemon/\(i)")!)
            let response = try await JSONDecoder().decode(
                Pokemon.self,
                from: data
            )
            pokemons.append(response)
        }
        return pokemons
    }
}
