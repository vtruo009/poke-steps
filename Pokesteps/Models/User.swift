//
//  User.swift
//  Pokesteps
//
//  Created by Van Truong on 6/13/25.
//

import Foundation

struct User: Identifiable, Codable, Equatable {
	var id: String
	var unlockedToday: Bool = false
	var stepGoal: Int = 3000
	var unlockedPokemons: Set<Int> = []
	
	init(id: String) {
		self.id = id
	}
}

extension User {
	static var testUser = User(id: "user1234")
}
