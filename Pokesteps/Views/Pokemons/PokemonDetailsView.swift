//
//  PokemonDetailsView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct PokemonDetailsView: View {
    var pokemon: Pokemon

    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea()

            VStack {
                PokemonView(pokemon: pokemon)
                    .frame(width: 320, height: 320)
                Text("\(pokemon.name)".capitalized)
                    .font(.system(size: 36))
                    .padding(.bottom)
                    .padding(.top, -15)
                    
                Text("\(PokemonFormatter.formattedID(pokemon.id))")
                    .font(.system(size: 20))
                    .foregroundStyle(.gray)
                    .padding(.top, -20)
                Spacer()
                HStack {
                    ForEach(pokemon.types, id: \.self) { type in
                        Rectangle()
                            .foregroundStyle(type.color)
                            .frame(width: 100, height: 35, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .overlay {
                                Text("\(type)".uppercased()).fontWeight(.medium)
                                    .fontDesign(.monospaced)
                            }
                    }
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Height: \(PokemonFormatter.formattedHeight(pokemon.height))")
                    Text("Weight: \(PokemonFormatter.formattedWeight(pokemon.weight))")
                }
                .font(.system(size: 20))
                .fontWeight(.medium)
                Spacer()
            }
        }
    }
}

#Preview {
    @Previewable @State var pokemon: Pokemon = Pokemon.testPokemons[1]
    PokemonDetailsView(pokemon: pokemon)
}
