//
//  PokedexView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct PokedexView: View {
	@EnvironmentObject var pokemonVM: PokemonViewModel

	@State var selectedPokemon: Pokemon? = nil
	@FocusState var isSearchFocused: Bool

	var body: some View {
		NavigationView {
			ZStack {
				AppColor.background.ignoresSafeArea()

				VStack(spacing: 0) {
					// Custom navigation title
					HStack {
						Text("Pokédex")
							.font(.custom("JetBrainsMono-Bold", size: 34))
							.foregroundColor(.primary)
						Spacer()
					}
					.padding(.horizontal, 16)
					.padding(.vertical, 20)
					.background(AppColor.background)

					// Custom search bar
					HStack {
						HStack {
							Image(systemName: "magnifyingglass")
								.foregroundColor(.secondary)
								.padding(.leading, 8)

							TextField(
								"Search Pokédex", text: $pokemonVM.searchText
							)
							.textFieldStyle(PlainTextFieldStyle())
							.focused($isSearchFocused)

							if !pokemonVM.searchText.isEmpty {
								Button(action: {
									pokemonVM.searchText = ""
								}) {
									Image(systemName: "xmark.circle.fill")
										.foregroundColor(.secondary)
								}
								.padding(.trailing, 8)
							}
						}
						.frame(maxWidth: .infinity, maxHeight: 40)
						.padding(.vertical, 8)
						.background(Color(.systemGray6))
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(Color.black, lineWidth: 1)
						)

						if isSearchFocused {
							Button("Cancel") {
								withAnimation(.easeInOut(duration: 0.5)) {
									isSearchFocused = false
									pokemonVM.searchText = ""
								}
							}
							.foregroundColor(.blue)
							.padding(.horizontal, 5)
							.transition(
								.move(edge: .trailing).combined(with: .opacity))
						}
					}
					.padding(.horizontal, 16)
					.padding(.bottom, 12)
					.animation(
						.easeInOut(duration: 0.3),
						value: isSearchFocused
					)

					if pokemonVM.pokemons.isEmpty {
						ProgressView("Loading Pokémons...")
					} else {
						ScrollViewReader { value in
							PokedexGridView(selectedPokemon: $selectedPokemon)
								.sheet(item: $selectedPokemon) { pokemon in
									NavigationView {
										PokemonDetailsView(pokemon: pokemon)
											.toolbar {
												ToolbarItem(
													placement:
														.cancellationAction
												) {
													Button("Close") {
														selectedPokemon = nil
													}
												}
											}
									}
								}
								.background(AppColor.background)
								.toolbarBackground(
									AppColor.background,
									for: .navigationBar
								)
								.onAppear {
									if let unlocked = pokemonVM.unlockedPokemon
									{
										withAnimation(.smooth) {
											value.scrollTo(
												unlocked.id, anchor: .center)
										}
										pokemonVM.unlockedPokemon = nil
									}
								}
						}
						.scrollDismissesKeyboard(.immediately)
					}

				}
			}
		}  // nav
	}
}

#Preview {
	@Previewable @State var userVM: UserViewModel = UserViewModel()
	PokedexView()
		.environmentObject(PokemonViewModel(user: userVM.user))
		.environmentObject(userVM)
}
