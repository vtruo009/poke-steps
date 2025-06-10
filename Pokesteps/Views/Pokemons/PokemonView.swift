//
//  PokemonView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct PokemonView: View {
    var pokemon: Pokemon

    var body: some View {
        VStack {
            GeometryReader { geo in
                Circle()
                    .foregroundStyle(.white)
                    .padding()
                    .overlay {
                        AsyncImage(url: pokemon.image) { image in
                            image.image?
                                .resizable()
                                .scaledToFit()
                                .frame(
                                    width: geo.size.width * 0.8,
                                    height: geo.size.width * 0.8)
                        }
                    }
            }
            .aspectRatio(1, contentMode: .fit)

        }
    }
}

#Preview {
    let testPokemon = Pokemon.testPokemons[2]
    PokemonView(pokemon: testPokemon)
}
