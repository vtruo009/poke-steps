//
//  PokestepsApp.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI
import SwiftData

@main
struct PokestepsApp: App {
	@StateObject private var healthVM = HealthViewModel()
	@StateObject private var pokemonVM = PokemonViewModel()
	@StateObject private var userVM = UserViewModel()
	@StateObject private var unlockManager = UnlockManager()
	
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
			MainTabView()
				.environmentObject(healthVM)
				.environmentObject(pokemonVM)
				.environmentObject(userVM)
				.environmentObject(unlockManager)
        }
        .modelContainer(sharedModelContainer)
    }
}
