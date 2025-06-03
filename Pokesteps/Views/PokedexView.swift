//
//  PokedexView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct PokedexView: View {
    @State var isPresenting: Bool = false

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
                            isPresenting = true
                        } label: {
                            PokemonView(pokemon: pokemon)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .sheet(isPresented: $isPresenting) {
                        NavigationView {
                            PokemonDetailsView()
                                .toolbar {
                                    ToolbarItem(placement: .cancellationAction)
                                    {
                                        Button("Dismiss") {
                                            isPresenting = false
                                        }
                                    }
                                }
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .background(AppColor.background)
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexView()
}
