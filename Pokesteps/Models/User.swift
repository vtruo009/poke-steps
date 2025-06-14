//
//  User.swift
//  Pokesteps
//
//  Created by Van Truong on 6/13/25.
//

import Foundation

struct User {
	var unlockedToday: Bool
	var stepGoal: Int
	var unlockedPokemon: Set<Int>
	
	init(unlockedToday: Bool, stepGoal: Int, unlockedPokemon: Set<Int>) {
		self.unlockedToday = unlockedToday
		self.stepGoal = stepGoal
		self.unlockedPokemon = unlockedPokemon
	}
	
	init() {
		self.init(unlockedToday: false, stepGoal: 3000, unlockedPokemon: [])
	}
}

extension User {
	static var testUser = User(
		unlockedToday: false,
		stepGoal: 3000,
		unlockedPokemon: [1,3,6,7,14,25,87]
	)
}
