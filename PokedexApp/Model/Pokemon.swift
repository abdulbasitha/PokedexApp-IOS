//
//  Pokemon.swift
//  PokedexApp
//
//  Created by ABDUL BASITH A on 03/09/21.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}


let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageUrl: "1", type: "posion"),
    .init(id: 1, name: "Ivysaur", imageUrl: "1", type: "posion"),
    .init(id: 2, name: "Venusar", imageUrl: "1", type: "posion"),
    .init(id: 3, name: "Charmander", imageUrl: "1", type: "fire"),
    .init(id: 4, name: "Charmelon", imageUrl: "1", type: "fire"),
    .init(id: 5, name: "Chaeizard", imageUrl: "1", type: "fire"),
]
