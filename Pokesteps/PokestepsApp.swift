//
//  PokestepsApp.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import Firebase
import SwiftData
import SwiftUI

@main
struct PokestepsApp: App {
	@Environment(\.scenePhase) private var phase
	@StateObject private var userVM = UserViewModel()
	@StateObject private var pokemonVM = PokemonViewModel(user: User.testUser)
	@StateObject private var hkManager = HealthKitManager()
	@StateObject private var unlockManager = UnlockManager()

	init() {
		FirebaseApp.configure()
	}

	var sharedModelContainer: ModelContainer = {
		let schema = Schema([
			Item.self
		])
		let modelConfiguration = ModelConfiguration(
			schema: schema, isStoredInMemoryOnly: false)

		do {
			return try ModelContainer(
				for: schema, configurations: [modelConfiguration])
		} catch {
			fatalError("Could not create ModelContainer: \(error)")
		}
	}()

	var body: some Scene {
		WindowGroup {
			MainTabView()
				.font(
					.custom(
						"JetBrainsMono-Regular",
						size: 14
					)
				)
				.environmentObject(pokemonVM)
				.environmentObject(userVM)
				.environmentObject(unlockManager)
				.environmentObject(hkManager)
				.onChange(of: userVM.user) { _, newUser in
					pokemonVM.updateUser(newUser)
				}
		}
		.onChange(of: phase) { _, newPhase in
			if newPhase == .active {
				Task {
					await userVM.loadUser()
				}
			}
		}
		.modelContainer(sharedModelContainer)
	}
}
