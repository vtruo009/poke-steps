//
//  PokedexView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct PokedexView: View {
	@EnvironmentObject var pokemonVM: PokemonViewModel
	
    //    var pokemons = Pokemon.testPokemons
    @State var selectedPokemon: Pokemon? = nil
    let unlockedCount: Int = 42
    let totalCount: Int = 151

    var body: some View {
        NavigationView {
            if pokemonVM.pokemons.isEmpty {
                ProgressView("Loading Pokémons...")
            } else {
                ScrollView {
                    let columns = [
                        GridItem(),
                        GridItem(),
                    ]
                    Section(
                        header: Text("Unlocked: \(unlockedCount)/\(totalCount)")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    ) {
                    }

                    LazyVGrid(columns: columns) {
                        ForEach(
                            pokemonVM.filteredPokemons
                        ) { pokemon in
                            Button {
                                selectedPokemon = pokemon
                            } label: {
                                VStack {
                                    PokemonView(pokemon: pokemon)
                                    Text("\(pokemon.name)")
                                        .font(.system(size: 20))
                                        .padding(.bottom)
                                        .padding(.top, -15)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .animation(
                        .easeIn(duration: 0.3),
                        value: pokemonVM.filteredPokemons
)
                    .padding(.horizontal, 10)
                }
                .sheet(item: $selectedPokemon) { pokemon in
                    NavigationView {
                        PokemonDetailsView(pokemon: pokemon)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Close") {
                                        selectedPokemon = nil
                                    }
                                }
                            }
                    }
                }
                .background(AppColor.background)
                .navigationTitle("Pokédex")
            }
        }
        .searchable(text: $pokemonVM.searchText, prompt: "Search Pokédex")
    }
}

#Preview {
	PokedexView()
		.environmentObject(PokemonViewModel())
}
