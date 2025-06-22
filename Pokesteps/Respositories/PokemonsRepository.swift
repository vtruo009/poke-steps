//
//  PokemonsRepository.swift
//  Pokesteps
//
//  Created by Van Truong on 6/21/25.
//

import Foundation
import FirebaseFirestore

struct PokemonsRepository {
	static let pokemonsRef = Firestore.firestore().collection("pokemons")
	
	static func loadPokemons() async throws -> [Pokemon] {
		let querySnapshot = try await pokemonsRef.getDocuments()
		let allPokemons = try querySnapshot.documents.map { doc in
			try doc.data(as: Pokemon.self)
		}
		return allPokemons.sorted { $0.id < $1.id }
	}
}
