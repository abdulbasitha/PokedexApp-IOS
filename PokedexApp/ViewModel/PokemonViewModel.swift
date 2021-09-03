//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by ABDUL BASITH A on 03/09/21.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemon()
    }
    
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.pareseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            print(pokemon)
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
        
    }
    func backgroundColor(forType type:String) -> UIColor {
        
        switch type {
        case "fire": return .systemGreen
        case "poision": return .systemGreen
        case "water": return .systemBlue
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemTeal
        case "fairy": return .systemIndigo
        default: return .systemIndigo
            
        }
    }
    
    
}

extension Data {
    func pareseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}

