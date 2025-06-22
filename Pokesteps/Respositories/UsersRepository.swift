//
//  UsersRepository.swift
//  Pokesteps
//
//  Created by Van Truong on 6/21/25.
//

import FirebaseFirestore
import Foundation

struct UsersRepository {
	static let userIDKey = "localUserId"
	static let usersRef = Firestore.firestore().collection("users")
	
	static func getOrCreateUserID() -> String {
		if let savedId = UserDefaults.standard.string(forKey: userIDKey) {
			return savedId
		} else {
			let id = UUID().uuidString
			UserDefaults.standard.set(id, forKey: userIDKey)
			return id
		}
	}

	static func loadOrCreate() async throws -> User {
		let id = getOrCreateUserID()
		let document = usersRef.document(id)
		
		let snapshot = try await document.getDocument()
		if snapshot.exists {
			return try snapshot.data(as: User.self)
		} else {
			let newUser = User(id: id)
			try await document.setData(from: newUser)
			return newUser
		}
	}
	
	static func update(_ user: User) async throws {
		try await usersRef.document(user.id).setData(from: user)
	}
}
