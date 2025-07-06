//
//  UserViewModel.swift
//  Pokesteps
//
//  Created by Van Truong on 6/13/25.
//

import Foundation
import FirebaseFirestore

@MainActor
class UserViewModel: ObservableObject {
	@Published var user: User = User.testUser
	
	init() {
		Task {
			await loadUser()
		}
	}
	
	func unlockPokemon(_ pokemonId: Int) {
		user.unlockedToday = true
		user.unlockedPokemons.insert(pokemonId)
		Task {
			try? await UsersRepository.update(user)
		}
	}
	
	func updateStepGoal(to newGoal: Int) {
		user.stepGoal = newGoal
		Task {
			try? await UsersRepository.update(user)
		}
	}
	
	func loadUser() async {
		do {
			let user = try await UsersRepository.loadOrCreate()
			self.user = user
		} catch {
			print("Failed to load user: \(error)")
		}
	}
}
