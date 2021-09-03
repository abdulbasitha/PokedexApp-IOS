//
//  PokemonCell.swift
//  PokedexApp
//
//  Created by ABDUL BASITH A on 03/09/21.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    let backgroudColor:Color
    
    init(pokemon : Pokemon, viewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroudColor = Color(viewModel.backgroundColor(forType: pokemon.type))
    }
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                HStack {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
      
        .background(backgroudColor)
        .cornerRadius(12)
        .shadow(color: backgroudColor, radius: 6, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

//struct PokemonCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonCell(pokemon: MOCK_POKEMON[3])
//    }
//}
