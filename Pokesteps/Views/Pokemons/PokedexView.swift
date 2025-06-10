//
//  PokedexView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var pokemonData = PokemonData()
    @State var selectedPokemon: Pokemon? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                let columns = [
                    GridItem(),
                    GridItem(),
                ]
                LazyVGrid(columns: columns) {
                    ForEach(pokemonData.pokemons) { pokemon in
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
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexView()
}
