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
        
        try await withThrowingTaskGroup(of: Pokemon.self) { group in
            for id in 1...151 {
                group.addTask {
                    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    return try JSONDecoder().decode(Pokemon.self, from: data)
                }
            }
            
            for try await pokemon in group {
                pokemons.append(pokemon)
            }
        }
        
        return pokemons.sorted { $0.id < $1.id}
    }
}
