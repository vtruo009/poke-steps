//
//  UnlockManager.swift
//  Pokesteps
//
//  Created by Van Truong on 6/16/25.
//
import Foundation

class UnlockManager: ObservableObject {
	@Published var showPokemonUnlocked: Bool = false
	@Published var selectedTab: Int = 0
}
