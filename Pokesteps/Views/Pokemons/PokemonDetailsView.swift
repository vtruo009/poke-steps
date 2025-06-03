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
            AppSetting.background.ignoresSafeArea()
            
            VStack {
                PokemonView(pokemon: pokemon)
                    .frame(width: 320, height: 320)
                Text("\(pokemon.name)")
                    .font(.system(size: 36))
                    .padding(.bottom)
                    .padding(.top, -15)
                
                // TODO: Replace with computed variable to format id - #0001
                Text("#000\(pokemon.id)")
                    .font(.system(size: 20))
                    .foregroundStyle(.gray)
                    .padding(.top, -20)
                Spacer()
                HStack {
                    ForEach(pokemon.type, id: \.self) { type in
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
                // TODO: Replace with computed variable to formated height & weight
                Text("Height: \(pokemon.height)")
                Text("Weight: \(pokemon.weight)")
                Spacer()
            }
        }
    }
}

#Preview {
    @Previewable @State var pokemon: Pokemon = Pokemon.testPokemons[1]
    PokemonDetailsView(pokemon: pokemon)
}
