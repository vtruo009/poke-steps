//
//  UserViewModel.swift
//  Pokesteps
//
//  Created by Van Truong on 6/13/25.
//

import Foundation

class UserViewModel: ObservableObject {
	@Published var user = User.testUser
	
	func changeUnlockStatus() {
		user.unlockedToday = true
	}
	
	func updateStepGoal(with newGoal: Int) {
		user.stepGoal = newGoal
	}
}
