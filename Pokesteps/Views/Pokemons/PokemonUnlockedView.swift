//
//  PokemonUnlockedView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/15/25.
//

import SwiftUI

struct PokemonUnlockedView: View {
	var pokemon: Pokemon
	@State private var showPokedex = false

	@Binding var selectedTab: Int
	@Binding var showUnlockedPokemon: Bool

	var body: some View {
		VStack {
			VStack(alignment: .center) {
				Text("You've unlocked \(pokemon.name)!")
					.font(.system(size: 50))
					.multilineTextAlignment(.center)
					.foregroundStyle(.white)
			}

			PokemonView(pokemon: pokemon, viewStyle: .plain)

			Button {
				print("go to pokedex")
				showUnlockedPokemon = false
				selectedTab = 1
			} label: {
				Text("View in Pokédex")
					.padding(.horizontal, 20)
					.padding(.vertical, 10)
					.fontWeight(.semibold)
					.background(
						RoundedRectangle(cornerRadius: 10)
							.fill(AppColor.yellow)
					)
			}
			.buttonStyle(PlainButtonStyle())
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.black.opacity(0.9).ignoresSafeArea())
	}
}

#Preview {
	@Previewable @State var tab = 0
	@Previewable @State var show = false
	var pokemon: Pokemon = Pokemon.testPokemons[4]

	PokemonUnlockedView(
		pokemon: pokemon,
		selectedTab: $tab,
		showUnlockedPokemon: $show
	)
}
