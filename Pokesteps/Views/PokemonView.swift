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
            ZStack {
                Circle().foregroundStyle(.yellow).padding()
                AsyncImage(url: URL(string: pokemon.image)) { image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            Text("\(pokemon.name)").font(.largeTitle).padding(.bottom)
        }
    }
}

#Preview {
    var testPokemon = Pokemon()
    PokemonView(pokemon: testPokemon)
}
