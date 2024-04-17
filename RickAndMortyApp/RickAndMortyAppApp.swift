//
//  RickAndMortyAppApp.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import SwiftUI

@main
struct RickAndMortyAppApp: App {
    init() {
        configureURLCache()
    }
    var body: some Scene {
        WindowGroup {
            CharactersView()
        }
    }
    
    private func configureURLCache() {
        let cache = URLCache.shared
        cache.diskCapacity = 100 * 1024 * 1024
        cache.memoryCapacity = 100 * 1024 * 1024
    }
}
