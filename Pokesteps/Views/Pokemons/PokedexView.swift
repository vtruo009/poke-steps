//
//  PokedexView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct PokedexView: View {
    @State var selectedPokemon: Pokemon? = nil

    let pokemons: [Pokemon] = Pokemon.testPokemons

    var body: some View {
        NavigationView {
            ScrollView {
                let columns = [
                    GridItem(),
                    GridItem(),
                ]
                LazyVGrid(columns: columns) {
                    ForEach(pokemons, id: \.id) { pokemon in
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
            .background(AppSetting.background)
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexView()
}
