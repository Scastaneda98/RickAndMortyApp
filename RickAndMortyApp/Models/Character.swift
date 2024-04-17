//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
