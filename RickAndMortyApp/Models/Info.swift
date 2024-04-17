//
//  Info.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import Foundation

struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}
